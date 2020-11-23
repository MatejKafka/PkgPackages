@echo off
:: setup GOPATH and GOROOT
set GOROOT=%~dp0\..\app
set GOPATH=%GOPATH%;%~dp0\..\data\packages
%~dp0\..\app\bin\go.exe %*