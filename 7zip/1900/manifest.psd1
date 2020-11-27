@{
	Name = "7zip"
	Architecture = "x64"

	Version = "1900" # 19.0
	_Hash = "0F5D4DBBE5E55B7AA31B91E5925ED901FDF46A367491D81381846F05AD54C45E"
	
	Install = {
		$Version = $this.Version
		$Url = "https://www.7-zip.org/a/7z$Version-x64.exe"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe" -NoSymlink
	}
}