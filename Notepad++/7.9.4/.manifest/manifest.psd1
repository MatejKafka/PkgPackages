@{
	Name = "Notepad++"
	Architecture = "x64"
	
	Version = "7.9.4"
	_Hash = "DF4E364873A8097FEF716D4303D294BF5A71821FE10025A6505FCEC968FA9C4D"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v$Version/npp.$Version.portable.x64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		param(
				[switch]
			$RedirectNotepad,
				[switch]
			$NoThemeCheck
		)

		if ($RedirectNotepad) {
			Assert-Admin "Redirecting Notepad to Notepad++ requires administrator privileges."
		}

		Assert-Directory "./config"
		Assert-Directory "./cache"

		# this makes npp store its config in the provided directory
		$ConfigPath = [string](Resolve-Path "./config")
		Assert-File "./app/cloud/choice" {$ConfigPath} {
			param($File)
			if ($ConfigPath -eq (Get-Content -Raw $File)) {return $false}
			$ConfigPath | Set-Content $File -NoNewline
			return $true
		}

		Set-SymlinkedPath "./config/backup" "./cache/backup" Directory
		Set-SymlinkedPath "./app/plugins/Config" "./config/plugins" Directory -Merge
		Set-SymlinkedPath "./app/session.xml" "./config/session.xml" File

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

