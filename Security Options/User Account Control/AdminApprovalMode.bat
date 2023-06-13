@echo off

REM Enable UAC to run all administrators in Admin Approval Mode
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f

echo UAC is now configured to run all administrators in Admin Approval Mode.
pause