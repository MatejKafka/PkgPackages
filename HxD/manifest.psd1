@{
	Name = "HxD"
	Version = "2.2.0.0"
	Architecture = "amd64"
	Enable = {
		Set-SymlinkedPath -IsDirectory "./app/Settings" "./config"
		Export-Shortcut "HxD" "./app/HxD64.exe"
		Disable-DisplayScaling "./app/HxD64.exe"		
	}
}

