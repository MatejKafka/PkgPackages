@echo off
:: SSH wrapper used by git, resets HOME and PATH back to original value for SSH

setlocal
set "HOME=%REAL_HOME%
set "PATH=%ORIG_PATH%

ssh %*