@{
	Name = "restic"
	Version = "0.9.6"
	Architecture = "x64"
	
	Enable = {
		Assert-Directory "./cache"
	
		Export-Command "restic" "./.manifest/restic_wrapper.cmd" -NoSymlink
	}
}

