@echo off

rem Export the security settings to a template file
secedit /export /cfg "%userprofile%\Desktop\security_template.inf"

rem Grant "Allow log on locally" permission to Users group
echo [Unicode]
echo Unicode=yes >> "%userprofile%\Desktop\security_template.inf"
echo [Version]
echo signature="$CHICAGO$" >> "%userprofile%\Desktop\security_template.inf"
echo Revision=1 >> "%userprofile%\Desktop\security_template.inf"
echo [Privilege Rights]
echo SeInteractiveLogonRight = *S-1-5-32-545 >> "%userprofile%\Desktop\security_template.inf"

rem Configure the modified template file
secedit /configure /db %windir%\security\new.sdb /cfg "%userprofile%\Desktop\security_template.inf" /areas USER_RIGHTS

echo "Permissions for Allow log on locally have been updated."
echo "Please restart the system for the changes to take effect."
pause