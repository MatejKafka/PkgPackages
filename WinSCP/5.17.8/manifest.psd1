@{
	Name = "WinSCP"
	Architecture = "x64"

	Version = "5.17.8"	
	_Hash = "bfe8709a90ad3b03618c1856c4f7c70948f045d39c8783ddfe4fe24f69efecb2"
	
	Install = {
		$Version = $this.Version
		# WinSCP authors don't want people to automate downloads directly from WinSCP site, and are trying to block it
		#  with generated one-time download URLs, so we'll use sourceforge instead
		$Url = "https://downloads.sourceforge.net/project/winscp/WinSCP/${Version}/WinSCP-${Version}-Portable.zip"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash -UserAgent Wget
	}
	
	Enable = {
		Assert-Directory "./cache"
		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Assert-File "./config/WinSCP.ini" {$this._DefaultConfig}
		Set-SymlinkedPath "./app/WinSCP.ini" "./config/WinSCP.ini" File
	
		# this cannot be symlink, otherwise WinSCP wouldn't find its config file
		Export-Command "winscp" "./app/WinSCP.com" -NoSymlink
		Export-Shortcut "WinSCP" "./app/WinSCP.exe" -StartMaximized
	}
	
	_DefaultConfig = @"
[Configuration\Interface]
RandomSeedFile=../data/winscp.rnd
DDTemporaryDirectory=../cache
"@
}