@echo off

REM Enable Do not store LAN Manager hash value on next password change
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v NoLMHash /t REG_DWORD /d 1 /f

echo Do not store LAN Manager hash value on next password change has been enabled.
pause