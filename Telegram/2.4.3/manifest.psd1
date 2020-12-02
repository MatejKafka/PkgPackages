@{
	Name = "Telegram"
	Architecture = "x86"
	
	Version = "2.4.3"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/telegramdesktop/tdesktop/releases/download/v$Version/tportable.$Version.zip"
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
