@echo off
:: add mingw to PATH
set PATH=%PATH%;%~dp0\..\..\mingw64\app\bin\
%~dp0\..\app\bin\nim.exe --nimcache:%~dp0\..\cache %*