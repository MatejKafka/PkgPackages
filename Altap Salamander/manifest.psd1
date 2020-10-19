@{
	Name = "Altap Salamander"
	Private = $true
	Version = "4.0"	
	Enable = {
		Write-Warning "Altap Salamander creates registry entries while running."
		Export-Shortcut "Altap Salamander" "./app/salamand.exe"
		Disable-DisplayScaling "./app/salamand.exe"
	}
}
