@{
	Name = "qBittorrent"
	Architecture = "x64"

	Version = "4.3.1"
	_Hash = "3258A75CC605AA83AE5B83F9392206568B9362C418BD842B0BB5B9C5211EB542"
	
	Install = {
		$Version = $this.Version
		# NSIS installer, 7zip can extract these
		$Url = "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${Version}/qbittorrent_${Version}_x64_setup.exe"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NsisInstaller
	}
	
	Enable = {
		Set-SymlinkedPath -IsDirectory "./app/profile" "./config"
		Export-Shortcut "qBittorrent" "./app/qbittorrent.exe"		
	}
}