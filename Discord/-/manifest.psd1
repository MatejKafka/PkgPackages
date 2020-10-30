@{
	Name = "Discord"
	Version = "-"
	Architecture = "x64"
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./logs"

		Set-SymlinkedPath "./app/discord-portable.log" "./logs/discord-portable.log"
		Set-SymlinkedPath "./app/data/modules.log"     "./logs/modules.log"

		Set-SymlinkedPath "./app/data/Preferences"   "./config/Preferences"
		Set-SymlinkedPath "./app/data/settings.json" "./config/settings.json"

		Set-SymlinkedPath "./app/data/Cookies"                    "./cache/Cookies.sqlite"
		Set-SymlinkedPath "./app/data/Cookies-journal"            "./cache/Cookies.sqlite-journal"
		Set-SymlinkedPath -IsDirectory "./app/data/Local Storage" "./cache/LocalStorage"
		Set-SymlinkedPath -IsDirectory "./app/data/Cache"         "./cache/Cache"
		Set-SymlinkedPath -IsDirectory "./app/data/GPUCache"      "./cache/GPUCache"
		Set-SymlinkedPath -IsDirectory "./app/data/File System"   "./cache/FileSystem"

		Export-Shortcut "Discord" "./app/discord-portable.exe"		
	}
}

