@{
	Name = "Telegram"
	Version = "-"
	Architecture = "x64"
	
	Enable = {
		Write-Warning "Config is kept in app directory, didn't have time to figure out what can be moved."
		
		Export-Shortcut "Telegram" "./app/Telegram.exe"		
	}
}

