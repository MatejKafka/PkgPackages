@{
	Name = "Shotcut"
	Architecture = "x64"
	
	Version = "20.11.28"
	_Hash = "45CDE8000364A9803776435918D7257AAF66FB5A848EE8D98BA55C395893ED9F"
	
	Install = {
		$FileName = "shotcut-win64-" + $this.Version.Replace(".", "") + ".zip"
		$Url = "https://github.com/mltframework/shotcut/releases/download/v$($this.Version)/${FileName}"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./data"
		
		# disable built-in updater and redirect config dir
		Export-Shortcut "Shotcut" "./app/Shotcut.exe" `
				-ArgumentList @("--noupgrade", "--appdata", (Resolve-Path "./data"))
	}
}