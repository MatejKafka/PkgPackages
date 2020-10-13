@{
	Name = "IntelliJ IDEA"
	Version = "2020.1.1"

	Install = {
		$Version = $this.Version
		$Url = "https://download.jetbrains.com/idea/ideaIU-$Version.win.zip"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/config"
		Assert-Directory "./config/plugins"
		Assert-Directory "./cache"
		Assert-Directory "./logs"

		Export-Shortcut "IntelliJ IDEA" "./.manifest/run.cmd" -IconPath "./app/bin/idea.ico"
	}
}
