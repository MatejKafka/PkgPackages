@{
	Name = "Wireshark"
	Private = $true
	Version = "-"
	Architecture = "amd64"
	Enable = {
		Set-SymlinkedPath -Directory "$env:APPDATA\Wireshark" "./config"
	}
}

