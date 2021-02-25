@echo off
setlocal

set "package_root=%~dp0"
:: get parent dir
for %%a in ("%package_root:~0,-1%") do set "package_root=%%~dpa"

set "MICRO_CONFIG_HOME=%package_root%/config"
"%package_root%/app/micro.exe" %*

endlocal