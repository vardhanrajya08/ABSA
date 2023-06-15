@echo off

REM Disable the "Network access: Allow anonymous SID/Name translation" setting
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v RestrictAnonymous /t REG_DWORD /d 2 /f

REM Check if the setting was successfully updated
if %errorlevel% equ 0 (
    echo "Network access: Allow anonymous SID/Name translation" setting has been disabled.
) else (
    echo An error occurred while updating the setting.
)

pause