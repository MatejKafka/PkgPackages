@{
	Name = "VLC"
	Version = "-"
	Architecture = "amd64"
	Enable = {
		Assert-Directory "./cache"

		Set-SymlinkedPath -IsDirectory "./app/Data/settings" "./config"
		Set-SymlinkedPath -IsDirectory "./app/Data/Temp" "./cache/temp"

		Export-Shortcut "VLC" "./app/VLCPortable.exe"		
	}
}

