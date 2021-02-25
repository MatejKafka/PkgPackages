@{
	Name = "librespeed-cli"
	Architecture = "x64"

	Version = "1.0.7"
	_Hash = "635ED0D4A1575C36D00A09C0DD08023AC6E99198B3336656BEDCAA0B6D546F07"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/librespeed/speedtest-cli/releases/download/v${Version}/librespeed-cli_${Version}_windows_amd64.zip"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "librespeed-cli" "./app/librespeed-cli.exe"
	}
}