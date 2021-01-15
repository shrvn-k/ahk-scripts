#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon

;Text expansions * modifier means no end character needed

:*:;shrug::¯\_(ツ)_/¯
:*:resumee::résumé
::rsp::₹

;Volume control 
Alt & PgUp::SoundSet, +1 
Alt & PgDn::SoundSet, -1 
Return

;Screenshot with Pause key 
Pause::SendInput, #!{PrintScreen}

;Always on top
^SPACE::  Winset, Alwaysontop, , A

;insert utc timestamp
:*:;utc::
FormatTime, CurrentDateTime, %A_NowUTC%, yyyy-MM-ddTHH:mm:ssZ
SendInput %CurrentDateTime%
Return

;insert ist timestamp
:*:;ist::
FormatTime, CurrentDateTime,, yyyy-MM-ddTHH:mm:ss
SendRaw %CurrentDateTime%+05:30
Return

;Put laptop to sleep 
#F4:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
Return

;Edit file in sublime text
#IfWinActive ahk_exe explorer.exe
^j:: ; ctrl+j
ClipSaved := ClipboardAll	;temp clipboard
Clipboard =
Send ^c
ClipWait ;waits for the clipboard to have content
Run, sublime_text.exe `"%clipboard%`"
Clipboard := ClipSaved
ClipSaved = 
Return

