@{
	Name = "Telegram"
	Version = "2.4.4"
	Architecture = "x86"
	
	Install = {
		$Url = "https://updates.tdesktop.com/tsetup/tportable.$($this.Version).zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Assert-Directory "./data"
	
		# TODO: make a PR to fix this mess
		Write-Warning "Everything is stored in ./data, because Telegram directory structure is completely fucked."
		
		Export-Shortcut "Telegram" "./app/Telegram.exe" -ArgumentList @(
				"-workdir", (Resolve-Path "./data")
				"-noupdate"
				"-externalupdater"
		)
	}
}
