@{
	Name = "php-lang"
	Architecture = "x64"

	Version = "8.0.0"
	_Hash = "712D36F5F40F128E0D5FC7DCA03F2386C9F39CD250ECD1A25FB574D3D28FFA49"
	
	Install = {
		# https://windows.php.net/download
		$Url = "https://windows.php.net/downloads/releases/php-$($this.Version)-Win32-vs16-x64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoSubdirectory
	}
	
	Enable = {
		param(
				[switch]
			$ProductionMode
		)
	
		Assert-Directory "./config"
		
		# TODO: setup session storage paths
		Assert-File "./config/php.ini" {
			if ($ProductionMode) {Get-Content -Raw "./app/php.ini-production"}
			else {Get-Content -Raw "./app/php.ini-development"}
		}
	
		Export-Command "php" "./app/php.exe" -NoSymlink
		Export-Command "php-cgi" "./app/php-cgi.exe" -NoSymlink
		Export-Command "phpw" "./app/php-win.exe" -NoSymlink
		
		# TODO: when optional dependencies are implemented, detect apache and optionally setup PHP support
	}
}