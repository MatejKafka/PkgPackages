@{
	Name = "Windows Terminal"
	Private = $true
	Version = "-"
	Architecture = "any"
	Enable = {
		$CONFIG_PATH = $env:LOCALAPPDATA + "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
		$PREVIEW_CONFIG_PATH = $env:LOCALAPPDATA + "\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState"
		
		Set-SymlinkedPath $CONFIG_PATH "./config"
		Set-SymlinkedPath $PREVIEW_CONFIG_PATH "./config"
	}
}

