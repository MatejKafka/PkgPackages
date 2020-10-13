@echo off

setlocal

:: see http://xpra.org/trac/browser/xpra/tags/v4.0.x/src/xpra/platform/paths.py
:: docs are (or at least were at the time of writing) outdated
set "XPRA_USER_CONF_DIRS=%~dp0\..\config\"
set "XPRA_SYSTEM_CONF_DIRS=%~dp0\..\config\"
set "XPRA_LOG_FILENAME=%~dp0\..\logs\Xpra.log"

start "" "%~dp0\..\app\Xpra.exe" %*