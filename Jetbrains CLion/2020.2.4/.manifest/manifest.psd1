@{
	Name = "Jetbrains CLion"
	Version = "2020.2.4"
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

		Export-Shortcut "Jetbrains CLion" "./.manifest/run.cmd" -IconPath "./app/bin/clion.ico"
	}
}
