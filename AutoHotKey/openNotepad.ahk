#z::Run https://www.autohotkey.com  ; Win+Z

!n::  ; Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return