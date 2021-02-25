@{
	Name = "apache-httpd"
	Architecture = "x64"

	Version = "2.4.46"
	_Hash = "A641C171E86182BAD94459B8ED6C372709DC553199E00D563FB92AB8465AB771"
	# version of Visual Studio this was built with
	# needed to construct the download URL
	_VsVersion = "VS16"
	
	Install = {
		# https://www.apachelounge.com/download/
		$Url = "https://www.apachelounge.com/download/$($this._VsVersion)/binaries/" +`
				"httpd-$($this.Version)-win64-$($this._VsVersion).zip"
		# use fake browser user agent, otherwise Apache Lounge will silently redirect us to localhost
		Install-FromUrl $Url -ExpectedHash $this._Hash -Subdirectory Apache24 -UserAgent Browser
	}
	
	Enable = {
		Set-SymlinkedPath "./app/conf" "./config" Directory
		Set-SymlinkedPath "./app/htdocs" "./data" Directory
		Set-SymlinkedPath "./app/logs" "./logs" Directory
		
		& ./.manifest/setupHttpdConf.ps1
		
		Export-Command 'httpd' "./app/bin/httpd.exe" -NoSymlink
	}
}