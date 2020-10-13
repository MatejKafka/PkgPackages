@{
	Name = "qBittorrent"
	Version = "4.2.5"
	Architecture = "amd64"
	Enable = {
		Set-SymlinkedPath -IsDirectory "./app/profile" "./config"
		Export-Shortcut "qBittorrent" "./app/qbittorrent.exe"
	}
}