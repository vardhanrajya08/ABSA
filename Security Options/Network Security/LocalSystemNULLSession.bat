@echo off

REM Disable LocalSystem NULL session fallback
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v DisableNullSessionFallback /t REG_DWORD /d 1 /f

echo LocalSystem NULL session fallback has been disabled.
pause