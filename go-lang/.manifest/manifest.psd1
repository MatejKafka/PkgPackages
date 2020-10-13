@{
	Name = "go-lang"
	Version = "1.14.2"
	Architecture = "amd64"
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.manifest/go_wrapper.cmd" -NoSymlink
	}
}

