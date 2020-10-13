try {
	# fix absolute path for used theme in config
	$ConfigPath = Resolve-Path "./config/config.xml"
	$Config = [XML](Get-Content $ConfigPath)
	$Config.NotepadPlus.GUIConfigs.GuiConfig | ? {$_.Name -eq "stylerTheme"} | % {
		if (Test-Path $_.path) {
			echo "Theme path is valid."
		} else {
			$ThemeName = Split-Path -Leaf $_.path
			try {
				$ThemePath = Resolve-Path ("./app/themes/" + $ThemeName)
			} catch {
				echo "Could not fix theme path - unknown theme name: '${$ThemeName}'."
			}
			$OldPath = $_.path
			$_.path = [String]$ThemePath
			$Config.Save($ConfigPath)
			echo "Fixed theme path from '${OldPath}' to '${ThemePath}'."
		}
	}
} catch {
	echo "Could not set theme path."
}