@{
	Name = "ProcessHacker"
	Version = "3.0.3074"
	Architecture = "amd64"
	
	Install = {
		# download zip from https://processhacker.sourceforge.io/
		# unzip "64bit" subdirectory to "./app"
		# copy copyright, readme,...
	}
	
	Enable = {
		param(
				[switch]
			$UseKernelDriver
		)
	
		$SettingsRelPath = "./config/ProcessHacker.exe.settings.xml"
	
		Assert-Directory "./config"
		Assert-File $SettingsRelPath

		# args list here: https://wj32.org/processhacker/forums/viewtopic.php?t=75
		$Args = "-elevate -settings ""$(Resolve-Path $SettingsRelPath)"""
		if (-not ($UseKernelDriver)) {
			$Args += " -nokph"
		}
		Export-Shortcut "ProcessHacker" "./app/ProcessHacker.exe" -Arguments $Args
	}
}

