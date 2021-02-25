@{
	Name = "nim-lang"
	Architecture = "x64"
	
	Version = "1.4.2"
	# https://nim-lang.org/download/nim-$($this.Version)_x64.zip.sha256
	_Hash = "f8f2e4ae0a61a917a23d465d4c8d84348695e551187233f2937b98639a59ca9a"
	
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

