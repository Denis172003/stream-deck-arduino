Tab::              Focus("recent") ; Opens the last used window per monitor
Numpad0::              Focus("next")   ; Goes through all of the windows per monitor

Focus(z_order) { ; written by iseahound 2022-09-16
   Tooltip ; Reset Tooltip.

   static past := ""          ; Saves the last z_order parameter passed.
   static z := 0              ; Saves the last z_order. (Use past to initialize.)
   windows := AltTabWindows() ; Gather Alt-Tab window list.
   debug := False

   ; Do nothing if no windows are found.
   if (windows.length == 0)
      return 0

   ; Sole window.
   if (windows.length == 1) {
      WinActivate windows[1]
      return windows[1]
   }

   ; Check if the number of normal windows is at least 2.
   ; AlwaysOnTop windows are never activated since they are always on top.
   always_on_top := 0
   for hwnd in windows
      if 0x8 & WinGetExStyle(hwnd)
         always_on_top += 1
   if (windows.length - always_on_top < 2) {
      WinActivate windows[-1] ; AlwaysOnTop windows are listed first.
      return windows[-1]
   }

   ; Case: Switches to the most recent window. Ignores always on top windows, cause they're always on top.
   recent() {
      ; Search for the window that is next in the z_order after the current active window.
      loop windows.length
         z := A_Index + 1
      until (WinActive('A') = windows[A_Index])

      ; If the current window is not in the list, such as the desktop or another monitor...
      ; Get the second window that is not always on top.
      if (z > windows.length) ; no-break
         loop windows.length
            z := A_Index + 1
         until not (0x8 & WinGetExStyle(windows[A_Index]))

      ; Cases where there are 0 windows or 1 window are caught in the beginning.
      if (z > windows.length) ; no-break
         debug := True
   }
   if (z_order = "recent")
      recent()

   ; Case: Iterate through all the windows in a circular loop.
   if (z_order = "next") {
      if (z_order != past || z > windows.length)
         recent()
      else if (z < windows.length)
         z++
      else if (z = windows.length)
         ('After cycling through all the windows, repeat this step.')
   }

   ; Case: If z is a number. Can address elements in reverse: [-1] is the bottom element.
   if (z_order ~= "^-?\d+$")
      z := z_order
   

   if debug {
      res := ""
      for i, v in windows
         res .= i ", " (WinGetTitle(v) || WinGetClass(v)) "`n"
      return ToolTip(res)
   }
   

   past := z_order
   hwnd := hwnd ?? windows[z]
   WinActivate "ahk_id" hwnd

   return hwnd
}

AltTabWindows() { ; modernized, original by ophthalmos https://www.autohotkey.com/boards/viewtopic.php?t=13288
   static WS_EX_APPWINDOW :=      0x40000 ; has a taskbar button
   static WS_EX_TOOLWINDOW :=        0x80 ; does not appear on the Alt-Tab list
   static GW_OWNER :=                   4 ; identifies as the owner window

   ; Get the current monitor the mouse cusor is in.
   DllCall("GetCursorPos", "uint64*", &point:=0)
   hMonitor := DllCall("MonitorFromPoint", "uint64", point, "uint", 0x2, "ptr")

   AltTabList := []

   DetectHiddenWindows False     ; makes IsWindowVisible and DWMWA_CLOAKED unnecessary in subsequent call to WinGetList()
   for hwnd in WinGetList() {    ; gather a list of running programs

      ; Check if the window is on the same monitor.
      if hMonitor == DllCall("MonitorFromWindow", "ptr", hwnd, "uint", 0x2, "ptr") {

         ; Find the top-most owner of the child window.
         owner := DllCall("GetAncestor", "ptr", hwnd, "uint", GA_ROOTOWNER := 3, "ptr") 
         owner := owner || hwnd ; Above call could be zero.

         ; Check to make sure that the active window is also the owner window.
         if (DllCall("GetLastActivePopup", "ptr", owner) = hwnd) {

            ; Get window extended style.
            es := WinGetExStyle(hwnd)

            ; Must appear on the Alt+Tab list, have a taskbar button, and not be a Windows 10 background app.
            if (!(es & WS_EX_TOOLWINDOW) || (es & WS_EX_APPWINDOW))
               AltTabList.push(hwnd)
         }
      }
   }

   return AltTabList
}