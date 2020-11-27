@{
	Name = "qBittorrent"
	Architecture = "x64"

	Version = "4.3.1"
	_Hash = "3258A75CC605AA83AE5B83F9392206568B9362C418BD842B0BB5B9C5211EB542"
	
	Install = {
		$Version = $this.Version
		$Url = "https://netix.dl.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
				"qbittorrent-$Version/qbittorrent_${Version}_x64_setup.exe"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		Set-SymlinkedPath -IsDirectory "./app/profile" "./config"
		Export-Shortcut "qBittorrent" "./app/qbittorrent.exe"		
	}
}