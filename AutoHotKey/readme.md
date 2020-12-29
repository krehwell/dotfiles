# AutoHotKey For Windows Scripting (shortcut)

Recompile all the script by: `right click -> compile`

## Set It Run On Startup

Copy all the compile script (`.exe`) to: `%AppData%\Microsoft\Windows\Start Menu\Programs\Startup` or simple `Win+R -> shell:startup`

## Basic Command

`!` = `alt`
`+` = `shift`
`^` = `ctrl`
e.g: `!+f1` = `alt + shift + ctrl + f1`

## Basic Scripting

```
!+f1::
    run, C:\Unity.exe
return
```
means everytime hit `alt + shift + ctrl + f1` will run `Unity.exe`
