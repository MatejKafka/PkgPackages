@{
	Name = "neovim"
	Architecture = "x64"

	Version = "0.4.4"
	_Hash = "4B88DAAE8427624F82ABB10EB6E527F4B0C600E83AAA9A0857D06106B445BBD3"
	
	Install = {
		$Url = "https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"
		Install-Fromurl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Export-Command "vim" "./.manifest/nvim_wrapper.cmd" -NoSymlink
		Export-Command "nvim" "./.manifest/nvim_wrapper.cmd" -NoSymlink
		Export-Shortcut "NeoVim" "./.manifest/nvim-qt_wrapper.cmd" -Icon "./app/bin/nvim-qt.exe"
	}
}