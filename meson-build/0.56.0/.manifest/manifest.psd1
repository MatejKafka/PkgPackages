@{
	Name = "meson-build"
	Architecture = "*"

	Version = "0.56.0"
	_Hash = "291DD38FF1CD55FCFCA8FC985181DD39BE0D3E5826E5F0013BF867BE40117213"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/mesonbuild/meson/releases/download/$Version/meson-$Version.tar.gz"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Dependency "ninja-build"
	
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.manifest/meson_launcher.cmd" -NoSymlink
	}
}