@{
	Name = "ffmpeg"
	Version = "2020-02-13"
	Architecture = "amd64"
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe"
		Export-Command "ffplay" "./app/bin/ffplay.exe"
		Export-Command "ffprobe" "./app/bin/ffprobe.exe"
	}
}

