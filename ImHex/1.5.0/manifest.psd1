@{
	Name = "ImHex"
	Architecture = "x64"

	Version = "1.5.0"
	_Hash = "79E5DFCF0B5A997571180574A3D66FE469923139B70E933AB990874F84FBE391"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/WerWolv/ImHex/releases/download/v${Version}/ImHex_${Version}_Windows.zip"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		Write-Warning ("ImHex 1.5.0 leaves 'imgui.ini' config files in working " +`
				"directory (or ./app if cwd not specified, or C:\Windows\System32).")
		
		Export-Command "ImHex" "./app/ImHex.exe" -NoSymlink
		Export-Shortcut "ImHex" "./app/ImHex.exe"
	}
}