@echo off
setlocal
set "VSCODE_PORTABLE=%~dp0..\data\"
set "VSCODE_LOGS=%~dp0..\logs\"
cd "%~dp0.."
start "" "%~dp0..\app\Code.exe" %*
endlocal