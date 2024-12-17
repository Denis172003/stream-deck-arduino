#Requires AutoHotkey v2.0
 ; The first number is the X-coordinate and the second is the Y (relative to the screen).
  


;left::DllCall("mouse_event", "UInt", 0x0001, "Int", -Speed, "Int", 0, "UInt", 0, "UPtr", 0)
;Right::DllCall("mouse_event", "UInt", 0x0001, "Int", Speed, "Int", 0, "UInt", 0, "UPtr", 0)
;Up::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -Speed, "UInt", 0, "UPtr", 0)
;Down::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", Speed, "UInt", 0, "UPtr", 0)


,::{

    global xpos, ypos
    prevCM := CoordMode("Mouse", "Screen")
    MouseGetPos &xpos, &ypos
    CoordMode("Mouse", prevCM)

    DllCall("SetCursorPos", "int", 808, "int", 990) 
    MouseClick("Left")


    DllCall("SetCursorPos", "int", xpos, "int", ypos) 
}

.::{

    global xpos, ypos
    prevCM := CoordMode("Mouse", "Screen")
    MouseGetPos &xpos, &ypos
    CoordMode("Mouse", prevCM)

    DllCall("SetCursorPos", "int", 960, "int", 990) 
    MouseClick("Left")
  

    DllCall("SetCursorPos", "int", xpos, "int", ypos) 
}
    
return