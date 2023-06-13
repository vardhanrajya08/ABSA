@echo off

REM Enable UAC virtualization
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableVirtualization /t REG_DWORD /d 1 /f

echo UAC virtualization has been enabled.
pause