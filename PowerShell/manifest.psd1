@{
	Name = "PowerShell"
	Private = $true
	Version = "0.1.0"
	Enable = {
		$PsConfigPath = Resolve-Path ([Environment]::GetFolderPath("MyDocuments") + "\PowerShell")
		$ModulesPath = Join-Path $PsConfigPath ".\Modules"
		$ProfilePath = Join-Path $PsConfigPath ".\Microsoft.PowerShell_profile.ps1"

		Set-SymlinkedPath $ProfilePath "./config/profile.ps1"
		Set-SymlinkedPath -IsDirectory $ModulesPath "./config/Modules"

		# duplicated in profile.ps1, but some scripts use -noprofile to speedup startup
		Add-EnvVar "PSModulePath" (Resolve-Path "./config/Custom") -Systemwide
	}
}
