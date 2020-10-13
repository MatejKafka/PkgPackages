@echo off
:: SSH wrapper used by git, resets HOME back to original value for SSH

setlocal
set "HOME=%REAL_HOME%

ssh %*