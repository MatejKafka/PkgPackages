@{
	Name = "trid"
	Version = "2.24"
	Architecture = "amd64"
	Enable = {
		Export-Command "trid" "./app/trid.exe" -NoSymlink
	}
}

