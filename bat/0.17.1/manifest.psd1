@{
	Name = "bat"
	Architecture = "x64"

	Version = "0.17.1"
	_Hash = "699769A0F05D989C50BB53FA614C47130FC8BA2D68381F6922FF7C1500588325"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/sharkdp/bat/releases/download/v${Version}/bat-v${Version}-x86_64-pc-windows-msvc.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "bat" "./app/bat.exe"
	}
}