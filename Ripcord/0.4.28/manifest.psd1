@{
	Name = "Ripcord"
	Architecture = "x64"
	
	Version = "0.4.28"
	_Hash = "8BE721D23424701E289B1145273C67E6D22517DB5C501BD0AAA3CC0390B9E41A"
	
	Install = {
		$Url = "https://cancel.fm/dl/Ripcord_Win_$($this.Version).zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		Set-SymlinkedPath "./app/portable_data" "./config" Directory
		
		Assert-File "./config/settings.ini" {
			"[application]"
			"automatic_check_updates=false"
		} {
			param($File)
			$Changed = $false
			$Section = $null
			$c = Get-Content $File | % {
				if ($_.Trim() -match "^\[(.*)\]$") {
					$Section = $Matches.1
					return $_
				}
				if ($Section -eq "application" -and $_.Trim().StartsWith("automatic_check_updates=")) {
					$Value = $_.Split("=")[1].Trim()
					if ($Value -eq "false") {return $_}
					$Changed = $true
					return "automatic_check_updates=false"
				} else {
					return $_
				}
			}
			if (-not $Changed) {return}
			$c | Set-Content $File
		}
		
		Export-Shortcut "Ripcord" "./app/Ripcord.exe"
	}
}