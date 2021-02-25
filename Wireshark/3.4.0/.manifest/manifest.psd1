@{
	Name = "Wireshark"
	Architecture = "x64"

	Version = "3.4.0"
	_Hash = "32113E083409DE888468E0BFE74BA98E6D618F9685A56A06F15B0506FDF4E462"
	
	Install = {
		$Version = $this.Version
		$Url = "https://1.eu.dl.wireshark.org/win64/Wireshark-win64-$Version.exe"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash -NsisInstaller
	}
	
	Enable = {
		Assert-Directory "./data"
		Export-Shortcut "Wireshark" "./.manifest/wireshark_launcher.cmd" -Icon "./app/Wireshark.exe"
		Write-Warning "Wireshark updater currently writes to registry (HKCU/Software/Wireshark)."
	}
}