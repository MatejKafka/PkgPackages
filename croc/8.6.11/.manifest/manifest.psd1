@{
	Name = "croc"
	Architecture = "x64"

	Version = "8.6.11"
	_Hash = "DAB1F1CE0DC2CB6DABE908E31F66030A9F9327F9A8063AD34E78F80F67AEA2EB"

	Install = {
		$Version = $this.Version
		$Url = "https://github.com/schollz/croc/releases/download/v${Version}/croc_${Version}_Windows-64bit.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}

	Enable = {
		Export-Command "croc" "./.manifest/croc_wrapper.cmd" -NoSymlink
	}
}