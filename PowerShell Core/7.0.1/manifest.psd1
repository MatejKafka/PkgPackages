@{
	Name = "PowerShell Core"
	Version = "7.0.1"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Arch = $this.Architecture
		$Url = "https://github.com/PowerShell/PowerShell/releases/download/v$Version/PowerShell-$Version-win-$Architecture.zip"
		Install-FromUrl $Url -NoSubdirectory
	}

	# currently, we cannot enable, as pwsh has hardcoded config paths
}
