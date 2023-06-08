@echo off
setlocal EnableDelayedExpansion

REM Step 1: Create a temporary registry file
echo Windows Registry Editor Version 5.00 > temp.reg
echo. >> temp.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >> temp.reg
echo "ClearTextPassword"=dword:00000001 >> temp.reg

REM Step 2: Import the registry file
reg import temp.reg > nul

REM Step 3: Clean up the temporary files
del temp.reg

echo "The 'Store passwords using reversible encryption' policy has been enabled."

pause
