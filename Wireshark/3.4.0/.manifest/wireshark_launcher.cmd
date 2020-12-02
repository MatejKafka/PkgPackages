@echo off
setlocal

set "WIRESHARK_CONFIG_DIR=%~dp0\..\data"
start "" "%~dp0\..\app\Wireshark.exe" -o "gui.update.enabled:FALSE" %*

endlocal