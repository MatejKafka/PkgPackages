@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.15.5"
	_Hash = "1d24be3a200201a74be25e4134fbec467750e834e84e9c7789a9fc13248c5507"
	
	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.manifest/go_wrapper.cmd" -NoSymlink
	}
}

