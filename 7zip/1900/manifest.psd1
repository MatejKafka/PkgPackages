@{
	Name = "7zip"
	Architecture = @("x64", "x86")

	Version = "1900" # 19.0
	_Hash = "AF6ECA1C8578DF776189EE7785AB5D21525E42590F788C4E82E961A36C3A5306"
	
	Install = {
		$Version = $this.Version
		$Url = "https://www.7-zip.org/a/7z$Version-extra.7z"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		if ([Environment]::Is64BitOperatingSystem) {
			Export-Command "7za" "./app/x64/7za.exe"
		} else {
			Export-Command "7za" "./app/7za.exe"
		}
	}
}