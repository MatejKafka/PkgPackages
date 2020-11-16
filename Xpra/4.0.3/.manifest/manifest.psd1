@{
	Name = "Xpra"
	Version = "4.0.3"
	Architecture = "x64"
	
	Install = {
		$URL = "http://xpra.org/dists/windows/Xpra-Client-Python3-x86_64_4.0.3-r27086.zip"
		Install-FromUrl $URL
	}
	
	Enable = {
		Assert-Directory .\config
		Assert-Directory .\logs
		
		Export-Shortcut "Xpra" "./.manifest/xpra_shortcut.cmd" -IconPath "./app/Xpra.exe"
		Export-Command "xpra" "./.manifest/xpra_cmd.cmd" -NoSymlink
		Export-Command "xpra-launcher" "./.manifest/xpra_launcher.cmd" -NoSymlink
	}
}