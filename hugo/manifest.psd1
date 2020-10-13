@{
	Name = "hugo"
	Version = "0.73.0"
	Architecture = "amd64"
	Enable = {
		Export-Command "hugo" "./app/hugo.exe"
	}
}