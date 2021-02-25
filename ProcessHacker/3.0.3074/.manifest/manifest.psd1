@{
	Name = "ProcessHacker"
	Version = "3.0.3074"
	Architecture = "x64"
	
	Install = {
		# this is latest stable version, but we are using nightly
		#$Url = "https://deac-ams.dl.sourceforge.net/project/processhacker/processhacker2/processhacker-2.39-bin.zip"
		
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
		# ensure auto-updates are disabled
		Assert-File $SettingsRelPath {$this._DefaultConfig} "./.manifest/DisableAutoUpdate.ps1"
		Assert-File $SettingsRelPath

		# args list here: https://wj32.org/processhacker/forums/viewtopic.php?t=75
		$Args = "-elevate -settings ""$(Resolve-Path $SettingsRelPath)"""
		if (-not ($UseKernelDriver)) {
			$Args += " -nokph"
		}
		Export-Shortcut "ProcessHacker" "./app/ProcessHacker.exe" -Arguments $Args
	}

_DefaultConfig = @'
<settings>
  <setting name="DisabledPlugins">Updater.dll</setting>
</settings>
'@
}

