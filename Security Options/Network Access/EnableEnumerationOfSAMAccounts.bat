@echo off

REM Set the security policy to disable anonymous enumeration of SAM accounts
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /areas SECURITYPOLICY /overwrite

REM Check if the policy was successfully updated
if %errorlevel% equ 0 (
    echo "Network access: Do not allow anonymous enumeration of SAM accounts" setting has been enabled.
) else (
    echo An error occurred while updating the security policy.
)

pause