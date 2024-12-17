#Requires AutoHotkey v2.0

; Custom volume buttons

NumpadAdd::Send "{Volume_Up}"            ;  Numpad Plus increases volume by 2 steps
NumpadSub::Send "{Volume_Down}"          ;  Numpad Minus decreases volume by 2 steps
Home::Send "{Volume_Mute}"        ;  PrintScreen mutes/unmutes

return 