@{
	Name = "Telegram"
	Architecture = "x86"
	
	Version = "2.4.7"
	_Hash = "8DF10352FFA08798389146E88F61ED7042CEEE1E031B72BAA2B9200F7868C595"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/telegramdesktop/tdesktop/releases/download/v$Version/tportable.$Version.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
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
