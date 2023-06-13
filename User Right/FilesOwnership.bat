@echo off

REM Ask user for directory path
set /p directoryPath="Enter the directory path: "

REM Take ownership of the directory
takeown /F "%directoryPath%" /R /A

REM Verify the ownership change
echo.
echo Ownership information for %directoryPath%:
echo.
icacls "%directoryPath%"

pause