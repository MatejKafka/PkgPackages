@{
	Name = "HxD"
	Version = "2.2.0.0"
	Architecture = "x64"
	Enable = {
		Set-SymlinkedPath "./app/Settings" "./config" Directory
		Export-Shortcut "HxD" "./app/HxD64.exe"
		Disable-DisplayScaling "./app/HxD64.exe"		
	}
}

