@echo off

:: figure out if we should set the global cache path parameter

:: check if any command was passed
if "%~1"=="" goto WithoutCache

if "%1" == "build" goto WithCache
if "%1" == "build-exe" goto WithCache
if "%1" == "build-lib" goto WithCache
if "%1" == "build-obj" goto WithCache
if "%1" == "run" goto WithCache
if "%1" == "translate-c" goto WithCache
if "%1" == "test" goto WithCache

goto WithoutCache


:WithCache
echo "with cache"
:: get absolute path to zig cache dir
:: batch files are absolutely atrocious and this is the simplest way I could find
set "zig-cache-dir=%~dp0"
:: get parent dir
for %%a in ("%zig-cache-dir:~0,-1%") do set "zig-cache-dir=%%~dpa"
:: get cache dir
set "zig-cache-dir=%zig-cache-dir%cache"

:: invoke zig with the cache path set
"%~dp0\..\app\zig.exe" %* --global-cache-dir "%zig-cache-dir%"
exit /b %errorlevel%


:WithoutCache
echo "without cache"
"%~dp0\..\app\zig.exe" %*
exit /b %errorlevel%