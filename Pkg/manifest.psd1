@{
	Name = "Pkg"
	Version = "0.2.1"
	# unfortunately, the fixed nim binaries for substitute executables
	#  are not portable, so we are currently bound to x64
	Architecture = "x64"
	
	Install = {
		echo "Pkg already installed. Auto-update is not supported right now."
	}
	
	Enable = {
		# add Pkg dir to PSModulePath
		Add-EnvVar "PSModulePath" (Resolve-Path .\app)

		Assert-Directory "./data"
		Assert-Directory "./data/manifests"
		Assert-Directory "./data/pkg_bin"
		# register default root if not already present
		Assert-File "./data/roots.txt" {Resolve-Path .\..}
	}
}

