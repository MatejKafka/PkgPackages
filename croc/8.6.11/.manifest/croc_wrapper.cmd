@echo off

set "root_dir=%~dp0"
:: get parent dir
for %%a in ("%root_dir:~0,-1%") do set "root_dir=%%~dpa"
set "CROC_CONFIG_DIR=%root_dir%config"

"%root_dir%app\croc.exe" %*