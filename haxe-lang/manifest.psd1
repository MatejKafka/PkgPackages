@{
	Name = "haxe-lang"
	Version = "4.1.2"
	Architecture = "amd64"
	
	Install = {
		$URL = 'https://github.com/HaxeFoundation/haxe/releases/download/4.1.2/haxe-4.1.2-win64.zip'
		Install-FromUrl $URL
	}
	
	Enable = {
		Export-Command "haxe" "./app/haxe.exe" -NoSymlink
	}
}