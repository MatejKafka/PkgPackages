@echo off

setlocal
set "NPM_CONFIG_USERCONFIG=%~dp0\..\config\npmrc"
set "NPM_CONFIG_GLOBALCONFIG=%~dp0\..\config\npmrc"

"%~dp0\..\app\npm.cmd" %*