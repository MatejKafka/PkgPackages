@{
	Name = "nim-lang"
	Architecture = "x64"
	
	Version = "1.2.0"
	# https://nim-lang.org/download/nim-$($this.Version)_x64.zip.sha256
	_Hash = "0E231DD44648F4ECB43AD8068DFA8D1CD1B86E807704C6475FC0D7C4F1341913"
	
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

