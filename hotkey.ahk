; ^a::
;     Send, "My First Script"
; return

; ^b::
;     MsgBox, Wow!
;     MsgBox, There are
;     Run, notepad.exe
;     WinActivate, Untitled - Notepad
;     WinWaitActive, Untitled - Notepad
;     Send, 7 lines{!}{Enter}
;     SendInput, inside the CTRL{+}J hotkey.
; return

; ::btw::
;     MsgBox, You typed btw.
; return

; ==============================================================================================

; to run this script file on PC startup
FileCreateShortcut, %A_ScriptFullPath%, %A_StartupCommon%\_AHK_.lnk

; ==============================================================================================

SetWorkingDir %A_ScriptDir%
#SingleInstance force
if not A_IsAdmin
    Run *RunAs "%A_ScriptFullPath%",, Min UseErrorLevel
Return

; ==============================================================================================

^!s::
    try {
        Run %A_ScriptDir%\IObitScreenShot\ScreenShot.exe				; full path
        ; Run IObitScreenShot\ScreenShot.exe				; relative path
    } catch { 
        MsgBox, Could not obtain admin privileges. 
    }
Return

; ==============================================================================================

IObitScreenShot() {
    ScreenShotPG = E:\Programs\IObit\IObitScreenShot\ScreenShot.exe
    Run %ScreenShotPG%
    ; Run *RunAs %ScreenShotPG%,, Min UseErrorLevel

    ; ScheduleName = "IObitScreenShot"
    ; ScreenShotPG = E:\Programs\IObit\IObitScreenShot\ScreenShot.exe /run /tn "%ScheduleName%"
    ; Run *RunAs %ScreenShotPG%,, Min UseErrorLevel
}

^#!s::
    try {
        IObitScreenShot()
    } catch { 
        MsgBox, Could not obtain admin privileges.
    }
Return

; ==============================================================================================





^+c::
    {
        Send, ^c
        Sleep 50
        Run, https://www.google.com/search?q=%clipboard%
        Return
    }
