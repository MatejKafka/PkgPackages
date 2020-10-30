@{
	Name = "VS Code"
	Version = "1.49.3"
	Architecture = "x64"
	
	Install = {
		$Version = $Pkg_Manifest.Version
		$Url = "https://update.code.visualstudio.com/$Version/win32-x64-archive/stable"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./config"
		Assert-Directory "./logs"
		
		Set-SymlinkedPath "./data/user-data/User/keybindings.json" "./config/keybindings.json"
		Set-SymlinkedPath "./data/user-data/User/settings.json" "./config/settings.json"
		
		Export-Shortcut "Visual Studio Code (VS Code)" "./.manifest/vscode_wrapper.cmd" -IconPath "./app/Code.exe"
	}
}