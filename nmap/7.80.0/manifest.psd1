@{
	Name = "nmap"
	Version = "7.80.0"
	Architecture = "x86"
	Enable = {
		Export-Command "nmap" "./app/nmap.exe" -NoSymlink
		Export-Command "ncat" "./app/ncat.exe" -NoSymlink
		Export-Command "nc" "./app/ncat.exe" -NoSymlink
	}
}