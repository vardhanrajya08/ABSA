@echo off

rem Export the current security settings to a template file
secedit /export /cfg "%userprofile%\Desktop\security_template.inf"

rem Append the required configuration to the template file
echo. >> "%userprofile%\Desktop\security_template.inf"
echo [Privilege Rights] >> "%userprofile%\Desktop\security_template.inf"
echo SeDebugPrivilege = *S-1-5-32-544 >> "%userprofile%\Desktop\security_template.inf"

rem Apply the modified template file to the local security database
secedit /configure /db %windir%\security\new.sdb /cfg "%userprofile%\Desktop\security_template.inf" /areas USER_RIGHTS

echo Debug programs privilege granted to the Administrator account.
echo Please restart the system for the changes to take effect.
pause