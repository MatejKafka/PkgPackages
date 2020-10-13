@{
	Name = "Notepad++"
	Version = "7.9"
	Architecture = "amd64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v$Version/npp.$Version.portable.x64.zip"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		param(
				[switch]
			$RedirectNotepad,
				[switch]
			$NoThemeCheck
		)

		if ($RedirectNotepad) {
			Assert-Admin "Redirecting Notepad requires administrator privileges."
		}

		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/plugins"
		Assert-Directory "./data/plugins/Config"

		Set-SymlinkedPath "./app/config.xml" "./config/config.xml"
		Set-SymlinkedPath "./app/contextMenu.xml" "./config/contextMenu.xml"
		Set-SymlinkedPath -Directory "./app/backup" "./cache/backup"
		
		if (-not (Get-Item ./app/plugins).LinkType -eq "SymbolicLink") {
			if (Test-Path ./app/plugins/Config) {
				Merge-Directories ./app/plugins/Config ./data/plugins/Config
			}
			Set-SymlinkedPath "./app/plugins" "./data/plugins" -Directory -Merge
		}

		Export-Shortcut "Notepad++" "./app/notepad++.exe" -StartMaximized
		Disable-DisplayScaling "./app/notepad++.exe"


		if (-not $NoThemeCheck) {
			& .\.manifest\UpdateThemePath.ps1
		} else {
			echo "Skipping theme path check."
		}

		if ($RedirectNotepad) {
			& .\.manifest\RedirectNotepad.ps1
		} else {
			echo "Skipping Notepad.exe redirect."
		}
	}
}

