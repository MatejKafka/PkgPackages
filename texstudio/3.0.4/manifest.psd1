@{
	Name = "texstudio"
	Architecture = "x64"
	
	Version = "3.0.4"
	_Hash = "6F025170503EEC51FDCF5A5422430FD4B191CAE498A9111D1C541CEE31E4BDC2"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/texstudio-org/texstudio/releases/download/${Version}/texstudio-${Version}-win-portable-qt5.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		Set-SymlinkedPath "./app/config" "./config" -Type Directory
		
		Export-Command "TeXstudio" "./app/texstudio.exe" -NoSymlink
		Export-Shortcut "TeXstudio" "./app/texstudio.exe"
	}
}