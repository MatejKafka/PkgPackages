SET "PACKAGE_DIR=%~dp0\.."

SET "PROFILE=%PACKAGE_DIR%\config\profile"

:: these don't really work now; see https://bugzilla.mozilla.org/show_bug.cgi?id=1669382
SET "MOZ_CRASHREPORTER_DATA_DIRECTORY=%PACKAGE_DIR%\cache\crashreporter"
SET "MOZ_CRASHREPORTER_EVENTS_DIRECTORY=%PACKAGE_DIR%\cache\events"
SET "MOZ_CRASHREPORTER_PING_DIRECTORY=%PACKAGE_DIR%\cache\pings"

cd /d "%PACKAGE_DIR%\app\"
start "" .\firefox.exe -profile "%PROFILE%" %*