@echo off

setlocal
:: we need to set HOME to config dir, otherwise git would pollute our home dir
set "REAL_HOME=%HOME%"
set "HOME=%~dp0\..\config\"
:: git also adds custom paths to PATH, which changes which SSH is used when ssh.exe is called,
::  so we need to reset it before calling ssh in our wrapper
set "ORIG_PATH=%PATH%"
:: tell git to use our custom SSH wrapper, which resets HOME to original value
set "GIT_SSH=%~dp0\ssh_wrapper.cmd"

"%~dp0\..\app\cmd\gitk.exe" %*