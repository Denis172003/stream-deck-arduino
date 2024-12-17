#Requires AutoHotkey v2.0



#Requires AutoHotkey v2.0

Right:: 
{
    static var := 0
    global xpos, ypos

    if (var = 0) {
        xpos := 85
        ypos := 33
        var := 1
    } else {
        xpos += 50
        if (xpos > 960)  
            xpos := 85   
    }

    prevCM := CoordMode("Mouse", "Screen")
    ; Retrieve current mouse position
    MouseGetPos &currX, &currY

    ; Move mouse to specified coordinates
    DllCall("SetCursorPos", "int", xpos, "int", ypos) 

    ; Perform a left mouse click
    MouseClick("Left")

    ; Restore original cursor mode
    CoordMode("Mouse", prevCM)
}




Left::{

    global xpos, ypos
    prevCM := CoordMode("Mouse", "Screen")
    MouseGetPos &xpos, &ypos
    CoordMode("Mouse", prevCM)

    DllCall("SetCursorPos", "int", 960, "int", 990) 
    MouseClick("Left")
  

    DllCall("SetCursorPos", "int", xpos, "int", ypos) 
}
    
return