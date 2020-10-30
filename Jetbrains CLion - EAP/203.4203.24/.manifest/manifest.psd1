@{
	Name = "Jetbrains CLion (EAP)"
	Version = "203.4203.24"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://download.jetbrains.com/cpp/CLion-$Version.win.zip"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/config"
		Assert-Directory "./config/plugins"
		Assert-Directory "./cache"
		Assert-Directory "./logs"

		Export-Shortcut "Jetbrains CLion (EAP)" "./.manifest/run.cmd" -IconPath "./app/bin/clion.ico"
	}
}
