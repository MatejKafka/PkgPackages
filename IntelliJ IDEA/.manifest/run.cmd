SET PACKAGE_DIR=%~dp0\..

SET IDEA_PROPERTIES=%PACKAGE_DIR%\config\idea.properties
SET   IDEA_VM_OPTIONS=%PACKAGE_DIR%\config\idea64.exe.vmoptions
SET IDEA64_VM_OPTIONS=%PACKAGE_DIR%\config\idea64.exe.vmoptions

cd %PACKAGE_DIR%\app\bin\
start "" .\idea64.exe %*