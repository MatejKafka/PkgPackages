@{
	Name = "Syncthing"
	Version = "1.6.1"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/syncthing/syncthing/releases/download/v$Version/syncthing-windows-amd64-v$Version.zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./logs"
	
		Export-Command "syncthing" "./.manifest/syncthing_wrapper.cmd" -NoSymlink
	}
}