try {
	# fix absolute path for used theme in config
	$ConfigPath = Resolve-Path "./config/config.xml"
	$Config = [XML](Get-Content $ConfigPath)
	
	$Config.NotepadPlus.GUIConfigs.GuiConfig | ? {$_.Name -eq "stylerTheme"} | % {
		if (Test-Path $_.path) {
			Write-Verbose "Theme path is valid."
			return
		}
		
		$ThemeName = Split-Path -Leaf $_.path
		if ($ThemeName -eq "stylers.xml") {
			$ThemePath = Resolve-Path ("./config/stylers.xml")
		} else {
			try {
				$ThemePath = Resolve-Path ("./app/themes/" + $ThemeName)
			} catch {
				throw "Could not fix theme path - unknown theme name: '$ThemeName'."
			}
		}
		$OldPath = $_.path
		$_.path = [String]$ThemePath
		Write-Information "Fixed theme path from '$OldPath' to '$ThemePath'."
	}
	
	$Config.NotepadPlus.GUIConfigs.GuiConfig | ? {$_.Name -eq "noUpdate"} | % {
		if ($_.InnerText -eq "yes") {
			Write-Verbose "Auto-update is already disabled."
		} else {
			$_.InnerText = "yes"
			Write-Information "Disabled auto-update."
		}
	}
	
	$Config.Save($ConfigPath)
} catch {
	Write-Warning "Could not set theme path and disable auto-update: $_"
}