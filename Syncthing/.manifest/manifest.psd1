@{
	Name = "Syncthing"
	Version = "1.6.1"
	Architecture = "amd64"
	
	Install = {
		$URL = "https://github.com/syncthing/syncthing/releases/download/v1.6.1/syncthing-windows-amd64-v1.6.1.zip"
		$tmp = New-TemporaryFile
		Invoke-WebRequest $URL -OutFile $tmp
		Rename-Item (Expand-Archive -Path $tmp .\ -PassThru)[0] "app"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./logs"
	
		Export-Command "syncthing" "./.manifest/syncthing_wrapper.cmd" -NoSymlink
	}
}