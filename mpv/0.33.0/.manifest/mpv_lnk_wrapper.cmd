@echo off
setlocal

set "package_root=%~dp0"
:: get parent dir
for %%a in ("%package_root:~0,-1%") do set "package_root=%%~dpa"

start "" "%package_root%\app\mpv.exe" ^
	"--config-dir=%package_root%\config" ^
	"--watch-later-directory=%package_root%\data\watch_later" ^
	"--log-file=%package_root%\logs\log.txt" ^
	"--keep-open=yes" ^
	%*

endlocal