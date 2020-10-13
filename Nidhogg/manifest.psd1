@{
	Name = "Nidhogg"
	Version = "1.0.0.14"
	Architecture = "amd64"
	Enable = {
		Write-Warning "Nidhogg creates registry entries while running."
		Export-Shortcut "Nidhogg" "./app/Nidhogg.exe"		
	}
}

