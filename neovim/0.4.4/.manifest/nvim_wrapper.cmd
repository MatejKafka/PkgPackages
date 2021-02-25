@echo off
setlocal

set "package_root=%~dp0"
:: get parent dir
for %%a in ("%package_root:~0,-1%") do set "package_root=%%~dpa"

set "XDG_CONFIG_HOME=%package_root%\config"
set "XDG_DATA_HOME=%package_root%\data"

"%package_root%\app\bin\nvim.exe" %*

endlocal