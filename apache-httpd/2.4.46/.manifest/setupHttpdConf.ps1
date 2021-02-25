# reads file, returns modified content (without saving)
$UpdateServerRoot = {
	param($SrcFile)
	Get-Content $SrcFile | % {
		if ($_.Trim().StartsWith("Define SRVROOT")) {
			'Define SRVROOT "' + (Resolve-Path ".\app") + '"'
		} else {$_}
	}
}

$ConfirmParams = @{
	Title = "Update 'SRVROOT' in httpd.conf?"
	Message = "Apache httpd.conf contains a 'SRVROOT' variable which is usually " +`
			"used to set ServerRoot, which Apache needs to correctly start. " +`
			"Should Pkg try to automatically update it to match current location? " +`
			"(this might break the config if you have customized it)"
}

# TODO: this is quite rough around the edges
Assert-File "./config/httpd.conf" `
	{& $UpdateServerRoot "./config/original/httpd.conf"} `
	{param($File)
		$UpdatedConfig = & $UpdateServerRoot $File
		# check if anything changed
		if ($null -eq (Compare-Object $UpdatedConfig (Get-Content $File))) {return $false}
		if (-not (Confirm-Action @ConfirmParams)) {return $false}
		$UpdatedConfig | Set-Content $File
		return $true
	}