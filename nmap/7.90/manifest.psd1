@{
	Name = "nmap"
	Architecture = "x86"
	
	Version = "7.90"
	# from https://nmap.org/dist/sigs/
	_Hash = "0FDE4A846B120BDC2A7A91897DECEA4C99DAC5BEF90426A10CEC177948BC36DD"
	
	Install = {
		# TODO: requires npcap, figure out how to enforce it
		$Version = $this.Version
		$Url = "https://nmap.org/dist/nmap-$Version-win32.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "nmap" "./app/nmap.exe" -NoSymlink
		Export-Command "ncat" "./app/ncat.exe" -NoSymlink
		Export-Command "nc" "./app/ncat.exe" -NoSymlink
	}
}