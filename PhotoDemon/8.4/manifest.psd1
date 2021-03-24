@{
	Name = "PhotoDemon"
	Version = "8.4"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/tannerhelland/PhotoDemon/releases/download/v$Version/PhotoDemon-$Version.zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Set-SymlinkedPath "./app/Data" "./data" Directory
		Export-Shortcut "PhotoDemon" "./app/PhotoDemon.exe"
	}
}