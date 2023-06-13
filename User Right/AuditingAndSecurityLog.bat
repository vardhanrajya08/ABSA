@echo off
setlocal

REM Export current security settings to a template file
secedit /export /cfg %userprofile%\Desktop\security_template.inf

REM Edit the security template file
set "templateFile=%userprofile%\Desktop\security_template.inf"

REM Modify the auditing settings
findstr /v /c:"SeAuditPrivilege" /c:"SeSecurityPrivilege" /c:"SeTakeOwnershipPrivilege" "%templateFile%" > "%templateFile%.tmp"
echo SeAuditPrivilege = *S-1-5-32-544>> "%templateFile%.tmp"
echo SeSecurityPrivilege = *S-1-5-32-544>> "%templateFile%.tmp"
echo SeTakeOwnershipPrivilege = *S-1-5-32-544>> "%templateFile%.tmp"
move /y "%templateFile%.tmp" "%templateFile%"

REM Import the modified security template
secedit /configure /db %windir%\security\new.sdb /cfg "%templateFile%" /areas SECURITYPOLICY

REM Refresh the security settings
gpupdate /force

echo "Manage auditing and security log settings updated for Administrator."

pause
