@{
	Name = "nim-lang"
	Version = "1.2.0"
	Architecture = "x64"
	Enable = {
		Assert-Dependency mingw64

		Assert-Directory "./cache"
		Set-SymlinkedPath "./app/config" "./config"

		# TODO: after Pkg dependencies are figured out, modify nim_wrapper.cmd
		# TODO: add other commands
		Export-Command "nim" "./.manifest/nim_wrapper.cmd" -NoSymlink
	}
}

