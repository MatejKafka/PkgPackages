@{
	Name = "JetBrains CLion"
	Architecture = "x64"

	Version = "2020.3.2"
	# found at https://download.jetbrains.com/cpp/CLion-$Version.win.zip.sha256
	_Hash = "A90A5DC5484902164EAF6B688FC0C0AD99E3D7F65EA8021094B5B7B97B26A640"

	Install = {
		$Version = $this.Version
		$Url = "https://download.jetbrains.com/cpp/CLion-$Version.win.zip"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/plugins"
		Assert-Directory "./logs"


		Assert-File "./config/idea.properties" {$this._IdeaProperties}
		Assert-File "./config/clion64.exe.vmoptions" {Get-Content -Raw "./app/bin/clion64.exe.vmoptions"}

		# ensure auto-updates are disabled
		Assert-File "./config/config/options/updates.xml" {$this._UpdatesXml} "./.manifest/DisableAutoUpdate.ps1"

		Export-Shortcut "CLion $($this.Version)" "./.manifest/clion_shortcut.cmd" -IconPath "./app/bin/clion.ico"
		Export-Command "clion" "./.manifest/clion_command.cmd" -NoSymlink
	}

# content of generated idea.properties
# it would be simpler&cleaner to have it as separate file in manifest directory,
#  but that would draw users to manually overwrite it and then
#  wonder why their changes were lost on update
_IdeaProperties = @'
# custom idea.properties file that allows us to use portable paths
package.path=${idea.home.path}/..

idea.system.path=${package.path}/cache
idea.config.path=${package.path}/config/config
idea.plugins.path=${package.path}/data/plugins
idea.log.path=${package.path}/logs
'@

_UpdatesXml = @'
<application>
  <component name="UpdatesConfigurable">
    <option name="CHECK_NEEDED" value="false" />
  </component>
</application>
'@
}
