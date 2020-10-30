@{
	Name = "Apache Maven"
	Version = "3.6.3"
	Architecture = "x64"
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./data/repository"
		
		Set-SymlinkedPath -Directory "./app/conf" "./config"
		
		# set local repository path
		$SettingsPath = Resolve-Path "./config/settings.xml"
		$Settings = [XML](Get-Content $SettingsPath)
		
		if ($Settings.settings | Get-Member -MemberType Property -Name localRepository) {
			echo "Local Maven repository is already setup."
		} else {		
			$el = $Settings.CreateElement("localRepository", $Settings.DocumentElement.NamespaceURI)
			[void]$el.AppendChild($Settings.CreateTextNode((Resolve-Path "./data/repository")))
			[void]$Settings.settings.PrependChild($el)
			$Settings.Save($SettingsPath)
			echo "Setup local Maven package repository at ./data/repository."
		}
		
		Export-Command "mvn" "./app/bin/mvn.cmd" -NoSymlink
	}
}
