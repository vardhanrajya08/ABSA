@echo off

REM Enable Restrict anonymous access to Named Pipes and Shares
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v RestrictNullSessAccess /t REG_DWORD /d 1 /f

echo Restrict anonymous access to Named Pipes and Shares has been enabled.
pause