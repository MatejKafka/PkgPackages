$RegPath = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe"
$ExePath = [string](Resolve-Path "./app/notepad++.exe")
$TargetCmd = $ExePath + " -notepadStyleCmdline -z"

if (-not (Test-Path $RegPath)) {
	$null = New-Item $RegPath
}

if ($TargetCmd -eq (Get-Item $RegPath).GetValue("Debugger", $null)) {
	return "Notepad.exe is already redirected to Notepad++."
}

Set-ItemProperty $RegPath -Name Debugger -Value $TargetCmd
echo "Redirected built-in Notepad.exe to Notepad++."