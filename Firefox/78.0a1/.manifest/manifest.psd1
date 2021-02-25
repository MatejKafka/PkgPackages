@{
	Name = "Firefox"
	Version = "78.0a1"
	
	Install = {
		# installation:
		#  download zip from mozilla repository
		#   (https://download-installer.cdn.mozilla.net/pub/firefox/)

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
		Import-Module "./.manifest/Update-AddonPath" -Verbose:$false

		Assert-Directory "./data"
		Assert-Directory "./config"

		# there are some cached absolute paths for addons; this corrects them in case the app directory moved since last Enable-Pkg run
		Update-AddonPath "./data/addonStartup.json.lz4"

		# add symlinks for easier editing
		Set-SymlinkedPath "./config/userChrome.css" "./data/chrome/userChrome.css" -Type File
		Set-SymlinkedPath "./config/userContent.css" "./data/chrome/userContent.css" -Type File
		# TODO: add other user-editable files as symlinks

		Export-Shortcut "Firefox" "./.manifest/firefox_wrapper.cmd" -IconPath "./app/firefox.exe"
	}
}
