@echo off
setlocal enabledelayedexpansion

REM Check if running with administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrative privileges. Please run as administrator.
    pause
    exit
)

REM Export the current security policy to a text file
secedit /export /cfg "%temp%\security.cfg"

REM Modify the security configuration file
set "configFile=%temp%\security.cfg"
set "newLine=SeRestorePrivilege = Administrators"

REM Check if the entry already exists in the config file
findstr /i /c:"SeRestorePrivilege =" "%configFile%" >nul
if %errorlevel% equ 0 (
    REM Entry exists, append Administrators to the existing line
    set "existingLine="
    for /f "usebackq delims=" %%a in ("%configFile%") do (
        set "line=%%a"
        setlocal enabledelayedexpansion
        if defined existingLine (
            set "existingLine=!existingLine!, Administrators"
        ) else (
            set "existingLine=!line!"
        )
        endlocal & set "existingLine=!existingLine!"
    )
    set "newLine=!existingLine!"
)

REM Replace the existing line or add a new line
findstr /i /v /c:"SeRestorePrivilege =" "%configFile%" >"%configFile%.tmp"
echo %newLine% >>"%configFile%.tmp"
move /y "%configFile%.tmp" "%configFile%" >nul

REM Import the modified security policy
secedit /configure /db "%windir%\security\local.sdb" /cfg "%configFile%" /areas USER_RIGHTS

REM Display completion message
echo Administrative permission for "Perform volume maintenance tasks" granted to Administrators.
pause
