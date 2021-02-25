@{
	Name = "micro"
	Architecture = "x64"
	Description = "'nano'-like terminal text editor"

	Version = "2.0.8"
	_Hash = "C551E5BAC87BDE3AF5157F34B2E84A4A2418E1F51CB6A02F85EC6260950AD966"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/zyedidia/micro/releases/download/v${Version}/micro-${Version}-win64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
	
		Export-Command "micro" "./.manifest/micro_wrapper.cmd" -NoSymlink
	}
}