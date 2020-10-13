@{
	Name = "Xpra"
	Version = "4.0.3"
	Architecture = "amd64"
	
	Install = {
		$URL = "http://xpra.org/dists/windows/Xpra-Client-Python3-x86_64_4.0.3-r27086.zip"
		Install-FromUrl $URL
	}
	
	Enable = {
		Assert-Directory .\config
		Assert-Directory .\logs
		
		Export-Shortcut "Xpra" "./.manifest/launcher.cmd" -IconPath "./app/Xpra.exe"
	}
}