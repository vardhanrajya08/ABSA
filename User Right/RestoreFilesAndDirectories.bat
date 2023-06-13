@echo off

REM Create a security template file
echo [Unicode] > template.inf
echo Unicode=yes >> template.inf
echo [Privilege Rights] >> template.inf
echo SeRestorePrivilege = *S-1-5-32-544 >> template.inf

REM Apply the security template
secedit /configure /db "%windir%\securitynew.sdb" /cfg template.inf /areas USER_RIGHTS

REM Clean up temporary files
del template.inf

REM Display success message
echo "Restore files and directories permission granted to Administrators."
echo.
pause