@echo off
setlocal

set "package_root=%~dp0"
:: get parent dir
for %%a in ("%package_root:~0,-1%") do set "package_root=%%~dpa"

"%package_root%\app\mpv.com" ^
	"--config-dir=%package_root%\config" ^
	"--watch-later-directory=%package_root%\data\watch_later" ^
	"--log-file=%package_root%\logs\log.txt" ^
	%*

endlocal