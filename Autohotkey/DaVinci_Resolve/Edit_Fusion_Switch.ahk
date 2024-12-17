#Requires AutoHotkey v2.0

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