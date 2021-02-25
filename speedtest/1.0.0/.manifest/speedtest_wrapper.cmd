@echo off
setlocal

set "package_root=%~dp0"
:: get parent dir
for %%a in ("%package_root:~0,-1%") do set "package_root=%%~dpa"

set "APPDATA=%package_root%\config"
:: weirdly, this has to be overriden; any value works,
::  and speedtest.exe uses provided APPDATA; if we keep
::  real USERPROFILE, it ignores the overriden APPDATA and writes
::  to real AppData
:: one might think that setting USERPROFILE and keeping original
::  APPDATA should work; nope, it doesn't
set "USERPROFILE=-"

"%package_root%\app\speedtest.exe" %*

endlocal