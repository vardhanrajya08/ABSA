@echo off

REM Step 1: Display the current value to the user
echo Current Reset Account Lockout Counter:
echo Loading...
ping 127.0.0.1 -n 2 > nul

net accounts

REM Step 2: Prompt the user for a new duration
set /p newDuration=Enter the new duration (in minutes) [Press Enter to keep current value]:

REM Step 3: Set the new duration if a value was entered
if not "%newDuration%"=="" (
    net accounts /lockoutduration:%newDuration%
    echo Reset Account Lockout Counter has been updated to %newDuration% minutes.
) else (
    echo Reset Account Lockout Counter remains unchanged.
)

pause
