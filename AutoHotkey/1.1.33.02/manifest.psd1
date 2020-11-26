@{
	Name = "AutoHotkey"
	Version = "1.1.33.02"
	Architecture = @("x64", "x86")
	
	Install = {
		$Version = $this.Version
		$Url = "https://www.autohotkey.com/download/1.1/AutoHotkey_$Version.zip"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		# TODO: deal with UI Access on normal machines
		if ([Environment]::Is64BitOperatingSystem) {
			Export-Command "AutoHotkey" "./app/AutoHotkeyU64.exe"
			Export-Shortcut "AutoHotkey" "./app/AutoHotkeyU64.exe"
		} else {
			Export-Command "AutoHotkey" "./app/AutoHotkeyU32.exe"
			Export-Shortcut "AutoHotkey" "./app/AutoHotkeyU32.exe"
		}
	}
}
