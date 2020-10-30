@{
	Name = "trid"
	Version = "2.24"
	Architecture = "x64"
	
	Enable = {
		Export-Command "trid" "./app/trid.exe" -NoSymlink
	}
}

