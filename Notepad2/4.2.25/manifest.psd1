@{
	Name = "Notepad2"
	Architecture = "x64"
	
	Version = "4.2.25"
	_Hash = "37A62F7E891335A1E671F444CEFE761FCD814A2FA1A3141FE2501D8433D8920B"
	
	Install = {
		$Url = "https://www.flos-freeware.ch/zip/notepad2_4.2.25_x64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		Assert-Directory "./config"
	
		# move config file, but without symlinking, or keep the existing one if present
		Assert-File "./config/Notepad2.ini" {cat "./app/Notepad2.ini"}
		if (Test-Path "./app/Notepad2.ini") {rm "./app/Notepad2.ini"}
		
		Export-Shortcut "Notepad2" "./app/Notepad2.exe" -ArgumentList @("/f", (Resolve-Path "./config/Notepad2.ini"))
	}
}