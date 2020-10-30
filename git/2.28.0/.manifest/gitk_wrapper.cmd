@echo off

setlocal
set "REAL_HOME=%HOME%"
set "HOME=%~dp0\..\config\"
:: tells git to use our custom SSH wrapper, which resets HOME to original value
set "GIT_SSH=%~dp0\ssh_wrapper.cmd"

"%~dp0\..\app\cmd\gitk.exe" %*