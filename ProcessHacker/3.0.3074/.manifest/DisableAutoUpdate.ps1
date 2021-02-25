param(
		[Parameter(Mandatory)]
	$File
)

$File = Resolve-Path $File

$d = [XML](Get-Content -Raw $File)
$settings = $d.settings
$elem = $settings.setting | ? {$_.name -eq "DisabledPlugins"}

if ($null -eq $elem) {
	$elem = $d.CreateElement("setting")
	$null = $elem.Attributes.Append($d.CreateAttribute("name"))
	$elem.name = "DisabledPlugins"
	$null = $settings.AppendChild($elem)
}

$disabledList = if ("" -eq $elem.InnerText) {
	@()
} else {
	$elem.InnerText.Split("|")
}

if ("Updater.dll" -in $disabledList) {
	return $false
}

$disabledList += "Updater.dll"
$elem.InnerText = $disabledList -join "|"

$null = $d.Save($File)
return $true