@{
	Name = "restic"
	Architecture = "x64"
	
	Version = "0.11.0"
	# from https://github.com/restic/restic/releases/download/v$Version/SHA256SUMS
	_Hash = "4D9EC99CEEC71DF88F47C5EBAE5FDD15474F7D36E9685A655830C2FC89AD9153"
	
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

