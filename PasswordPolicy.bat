@echo off

REM Set the value of X as 1 (password history size)
set X=1
echo value set as %X%
pause 
echo ---------------------------------------------------------------------------------------------------
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Microsoft\Windows\Sysvol\GPExtensions\{35378EAC-683F-11D2-A89A-00C04FBBCFA2} /v ExtensionDebugLevel /t REG_DWORD /d 2 /f
gpupdate /force
net accounts /uniquepw:%X%
echo ---------------------------------------------------------------------------------------------------
echo Password history policy has been set to remember %X% passwords.
echo ---------------------------------------------------------------------------------------------------
pause