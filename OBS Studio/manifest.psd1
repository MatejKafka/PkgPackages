@{
	Name = "OBS Studio"
	Version = "25.0.4"
	Architecture = "amd64"
	
	Install = {
		# download OBS Studio zip from https://github.com/obsproject/obs-studio/releases
		# (current filename is: OBS-Studio-25.0.4-Full-x64.zip)
		# unpack to 'app'
	}
	
	Enable = {
		# when OBS finds this file, it runs in portable mode
		Assert-File "./app/portable_mode.txt"
		
		Assert-Directory "./app/config"
		Set-SymlinkedPath "./app/config/obs-studio" "./config" -IsDirectory
		
		Export-Shortcut "OBS Studio" "./app/bin/64bit/obs64.exe"
	}
}

