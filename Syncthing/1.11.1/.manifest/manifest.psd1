@{
	Name = "Syncthing"
	Architecture = "x64"
	
	Version = "1.11.1"
	_Hash = "7A9DD65B5A64C38986157DE1D74D2279BBD731E00FDD010DB89F4409FEC74A6B"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/syncthing/syncthing/releases/download/v$Version/syncthing-windows-amd64-v$Version.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./logs"
	
		if (-not (Test-Path "./config/config.xml")) {
			Write-Verbose "Generating initial config..."
			$null = & "./.manifest/syncthing_wrapper.cmd" -generate="./config"
		} else {
			Write-Verbose "Config is already initialized."
		}
	
		Export-Command "syncthing" "./.manifest/syncthing_wrapper.cmd" -NoSymlink
	}
}