param(
		[Parameter(Mandatory)]
	$File
)

$d = [XML](Get-Content -Raw $File)
$c = $d.application.component
$options = $c.option
$prop = $options | ? {$_.name -eq "CHECK_NEEDED"}
if ($null -eq $prop) {
	$prop = $d.CreateElement("option")
	$prop.Attributes.Append($d.CreateAttribute("name"))
	$prop.Attributes.Append($d.CreateAttribute("value"))
	$prop.name = "CHECK_NEEDED"
	$c.AppendChild($prop)
}
if ($prop.value -eq "true") {return $false}
$prop.value = "true"
$d.Save($File)
return $true