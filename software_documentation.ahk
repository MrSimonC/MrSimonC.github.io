#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;===greenshot/psr alternative===
; Take screenshots (to a folder) when you windows+click. Assumes: Greenshot, Settings, Capture, change Milliseconds to wait before capture = 0
#~LButton::
	SendInput ^{PrintScreen}
Return

#~RButton::
	Sleep 200		;allow time for menus to appear
	SendInput ^{PrintScreen}
Return
