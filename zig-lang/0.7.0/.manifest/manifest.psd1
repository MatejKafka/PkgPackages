@{
	Name = "zig-lang"
	Version = "0.7.0"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://ziglang.org/download/$Version/zig-windows-x86_64-$Version.zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Assert-Directory "./cache"
	
		Export-Command "zig" "./.manifest/zig_wrapper.cmd" -NoSymlink
	}
}