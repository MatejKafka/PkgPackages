@{
	Name = "Notepad++"
	Version = "7.9"
	Architecture = "x64"
	
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

		Set-SymlinkedPath "./app/config.xml" "./config/config.xml" -Type File
		Set-SymlinkedPath "./app/contextMenu.xml" "./config/contextMenu.xml" -Type File
		Set-SymlinkedPath "./app/backup" "./cache/backup" -Type Directory
		
		if (-not (Get-Item ./app/plugins).LinkType -eq "SymbolicLink") {
			if (Test-Path ./app/plugins/Config) {
				Merge-Directories ./app/plugins/Config ./data/plugins/Config
			}
			Set-SymlinkedPath "./app/plugins" "./data/plugins" -Type Directory -Merge
		}

		Export-Shortcut "Notepad++" "./app/notepad++.exe" -StartMaximized
		Disable-DisplayScaling "./app/notepad++.exe"
		Export-Command "notepad++" "./app/notepad++.exe" -NoSymlink


		if (-not $NoThemeCheck) {
			& .\.manifest\UpdateThemePath.ps1
		} else {
			Write-Verbose "Skipping theme path check."
		}

		if ($RedirectNotepad) {
			& .\.manifest\RedirectNotepad.ps1
		} else {
			Write-Verbose "Skipping Notepad.exe redirect."
		}
	}
}

