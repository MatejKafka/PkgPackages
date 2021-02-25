@{
	Name = "restic"
	Architecture = "x64"
	
	Version = "0.9.6"
	# from https://github.com/restic/restic/releases/download/v$Version/SHA256SUMS
	_Hash = "A9507A67B50C7E4AB38C2334EF037A78CA5CC257DECF1D78B8AFBDC0FA73EE18"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/restic/restic/releases/download/v${Version}/restic_${Version}_windows_amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory

		$AppFiles = ls ./app
		if (@($AppFiles).Count -ne 1) {
			Write-Warning "Expected the archive to contain a single exe, but multiple items are present."
			return
		}
		Rename-Item $AppFiles "restic.exe"
	}
	
	Enable = {
		Assert-Directory "./cache"
	
		Export-Command "restic" "./.manifest/restic_wrapper.cmd" -NoSymlink
	}
}

