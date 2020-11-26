$DisableAutoUpdater_sb = {
	param($File)
	# TODO: FIXME: not very robust, ideally would use .ini parser
	$c = Get-Content -Raw $File
	if ($c.Contains("`nEnableAutoUpdates=")) {
		if ($c.Contains("`nEnableAutoUpdates=false")) {return $false}
		# change true to false
		$c = $c.Replace("`nEnableAutoUpdates=true", "`nEnableAutoUpdates=false")
	} else {
		# add config option to [General]
		$c = $c.Replace("[General]`n", "[General]`nEnableAutoUpdates=false`n")
	}
	$c | Set-Content $File
	return $true
}

Assert-File "./config/global.ini" {
	"[General]`n" +`
	"EnableAutoUpdates=false`n"
} $DisableAutoUpdater_sb