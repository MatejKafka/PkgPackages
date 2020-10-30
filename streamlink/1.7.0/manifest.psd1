@{
	Name = "streamlink"
	Version = "1.7.0"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/beardypig/streamlink-portable/releases/download/$Version/streamlink-portable-$Version-py3.6.5-amd64.zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/plugins"
		
		# overwrite launcher to use our config and plugin dir
		$this._launcherStr > ./app/streamlink.bat
		
		Export-Command "streamlink" "./app/streamlink.bat" -NoSymlink
	}
	
	_launcherStr = @"
@echo off
REM Change the code page for UTF8
chcp 65001 >NUL
set PYTHONIOENCODING=cp65001
"%~dp0\python\python.exe" "%~dp0\streamlink-script.py" --ffmpeg-ffmpeg "%~dp0\ffmpeg\ffmpeg.exe" --rtmp-rtmpdump "%~dp0\rtmpdump\rtmpdump.exe" --plugin-dirs "%~dp0\..\config\plugins" --config "%~dp0\..\config\streamlinkrc" %* --no-version-check
"@
}