@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.16"
	_Hash = "5cc88fa506b3d5c453c54c3ea218fc8dd05d7362ae1de15bb67986b72089ce93"
	
	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.manifest/go_wrapper.cmd" -NoSymlink
	}
}

