@{
	Name = "ngrok"
	Version = "2.3.35"
	Architecture = "amd64"
	Enable = {
		Export-Command "ngrok" "./app/ngrok.exe"
	}
}

