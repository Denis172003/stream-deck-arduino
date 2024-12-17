
^Numpad1:: ;Start Google Meet and copy link to clipboard
{
Run("chrome.exe https://meet.new/")
Sleep 3000
Send "^l"
Sleep 20
Send "^c"
}