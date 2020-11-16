@{
	Name = "ffmpeg"
	Version = "4.3.1-2020-11-08"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://www.gyan.dev/ffmpeg/builds/packages/ffmpeg-$Version-full_build.7z"
		Install-FromUrl $Url
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe"
		Export-Command "ffplay" "./app/bin/ffplay.exe"
		Export-Command "ffprobe" "./app/bin/ffprobe.exe"
	}
}

