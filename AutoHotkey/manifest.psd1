@{
	Name = "AutoHotkey"
	Version = "1.1.32.00"
	
	Install = {
		# download most recent 1.1 zip and unzip to app
		# https://www.autohotkey.com/download/1.1/
	}
	
	Enable = {
		Export-Shortcut "AutoHotkey" "./app/AutoHotkeyU64.exe"
		# TODO: deal with UI Access on normal machines
	}
}
