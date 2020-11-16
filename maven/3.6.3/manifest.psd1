@{
	Name = "Apache Maven"
	Version = "3.6.3"
	Architecture = "x64"
	
	Enable = {
		Set-SymlinkedPath -Directory "./app/conf" "./config"
		Assert-Directory "./data"
		Assert-Directory "./data/repository"
		
		
		# set local repository path
		$SettingsPath = Resolve-Path "./config/settings.xml"
		$Settings = [XML](Get-Content $SettingsPath)

		# create the XML element
		if (-not ($Settings.settings | Get-Member -MemberType Property -Name localRepository)) {
			$el = $Settings.CreateElement("localRepository", $Settings.DocumentElement.NamespaceURI)
			[void]$Settings.settings.PrependChild($el)
		}
		
		# check if the correct path is set
		$RepoPath = Resolve-Path "./data/repository"
		if ($Settings.settings.localRepository -eq $RepoPath) {
			Write-Verbose "Local Maven repository is already setup."
		} else {
			$Settings.settings.localRepository = $RepoPath
			$Settings.Save($SettingsPath)
			Write-Verbose "Setup local Maven package repository at ./data/repository."
		}
		
		Export-Command "mvn" "./app/bin/mvn.cmd" -NoSymlink
	}
}
