@{
	Name = "fast-cli@gesquive"
	Architecture = "x64"

	Version = "0.2.10"
	_Hash = "DB9ECEDCC5D40D646DBF90BA4CE7A18EF86AEF28A07AC64721174F48B96B1948"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/gesquive/fast-cli/releases/download/v${Version}/fast-cli-v${Version}-windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		Export-Command "fast-cli" "./app/fast-cli.exe"
	}
}