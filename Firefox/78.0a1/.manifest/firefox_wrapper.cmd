SET PACKAGE_DIR=%~dp0\..

SET PROFILE=%PACKAGE_DIR%\config\profile

SET MOZ_CRASHREPORTER_DATA_DIRECTORY=%PACKAGE_DIR%\cache\crashreporter
SET MOZ_CRASHREPORTER_EVENTS_DIRECTORY=%PACKAGE_DIR%\cache\events
SET MOZ_CRASHREPORTER_PING_DIRECTORY=%PACKAGE_DIR%\cache\pings

cd /d "%PACKAGE_DIR%\app\"
start "" .\firefox.exe -profile %PROFILE% %*