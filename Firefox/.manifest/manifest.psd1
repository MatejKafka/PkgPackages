@{
	Name = "Firefox"
	Version = "78.0a1"
	
	Install = {
		# installation:
		#  download zip from mozilla repository
		#   (https://download-installer.cdn.mozilla.net/pub/firefox/)
		#  add run.cmd to pass path to profile directory

		# possible content of autoconfig (see here: https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig)
		# pref("intl.locale.requested", "{{ .Locale }}");
		# // Extensions scopes
		# lockPref("extensions.enabledScopes", 4);
		# lockPref("extensions.autoDisableScopes", 3);
		# // Don't show 'know your rights' on first run
		# pref("browser.rights.3.shown", true);
		# // Don't show WhatsNew on first run after every update
		# pref("browser.startup.homepage_override.mstone", "ignore");
	}
	
	Enable = {
		Import-Module .\.manifest\Update-AddonPath

		Assert-Directory "./config"
		Assert-Directory "./config/profile"

		# there are some cached absolute paths for addons; this corrects them in case the app directory moved since last Enable-Pkg run
		Update-AddonPath "./config/profile/addonStartup.json.lz4"

		# add symlinks for easier editing
		Set-SymlinkedPath "./config/userChrome.css" "./config/profile/chrome/userChrome.css"
		Set-SymlinkedPath "./config/userContent.css" "./config/profile/chrome/userContent.css"

		Export-Shortcut "Firefox" "./.manifest/firefox_wrapper.cmd" -IconPath "./app/firefox.exe" -StartMaximized
	}
}
