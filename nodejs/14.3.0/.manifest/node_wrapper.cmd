@echo off

setlocal
:: also set npm config path here, in case node.exe is used to run npm
set "NPM_CONFIG_USERCONFIG=%~dp0\..\config\npmrc"
set "NPM_CONFIG_GLOBALCONFIG=%~dp0\..\config\npmrc"
set "NODE_REPL_HISTORY=%~dp0\..\data\node\node_repl_history.txt"

"%~dp0\..\app\node.exe" %*