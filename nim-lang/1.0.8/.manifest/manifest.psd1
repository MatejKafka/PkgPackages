@{
	Name = "nim-lang"
	Architecture = "x64"
	
	Version = "1.0.8"
	# https://nim-lang.org/download/nim-$($this.Version)_x64.zip.sha256
	_Hash = "ee549883fd49d346cde91fa000c0b60765592f348f8a4490388e19096cd0d56a"
	
	Install = {
		$Url = "https://nim-lang.org/download/nim-$($this.Version)_x64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Dependency mingw64

		Assert-Directory "./data"
		Assert-Directory "./data/nimble"
		Assert-Directory "./cache"
		Set-SymlinkedPath "./app/config" "./config" Directory

		# TODO: after Pkg dependencies are figured out, modify nim_wrapper.cmd
		# TODO: add other commands
		Export-Command "nim" "./.manifest/nim_wrapper.cmd" -NoSymlink
		Export-Command "nimble" "./.manifest/nimble_wrapper.cmd" -NoSymlink
	}
}

