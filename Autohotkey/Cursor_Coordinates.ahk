#Requires AutoHotkey v2.0
xpos:= ypos:=0
a:: 
{
    global xpos, ypos
    prevCM := CoordMode("Mouse", "Screen")
    MouseGetPos &xpos, &ypos
    CoordMode("Mouse", prevCM)
    MsgBox ("The cursor is at " . xpos . " xpos and " . ypos . " ypos.")
}

return