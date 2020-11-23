@{
	Name = "OBS Studio"
	Architecture = "x64"
	
	Version = "25.0.4"
	_Hash = "DB6214DCE625F429369F6E537A86C48ADBFA2D123B204F3E347B02CEAACA1B93"
	
	Install = {
		$Version = $this.Version
		$Arch = if ([Environment]::Is64BitOperatingSystem) {"x64"} else {"x86"}
		$Url = "https://github.com/obsproject/obs-studio/releases/download/$Version/OBS-Studio-$Version-Full-$Arch.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		# when OBS finds this file, it runs in portable mode
		Assert-File "./app/portable_mode.txt"
		
		Assert-Directory "./app/config"
		Set-SymlinkedPath "./app/config/obs-studio" "./config" -IsDirectory
		
		Export-Shortcut "OBS Studio" "./app/bin/64bit/obs64.exe"
	}
}

