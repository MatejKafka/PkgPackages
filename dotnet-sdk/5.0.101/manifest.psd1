@{
	Name = "dotnet-sdk"
	Architecture = "x64"

	Version = "5.0.101"
	_Hash = "00AAB5CD687B59EE889B6E22856E21890EB2DBA94AA15AED31A6B6E08F21DD59"
	
	Install = {
		$Version = $this.Version
		$Url = "https://dotnetcli.azureedge.net/dotnet/Sdk/$Version/dotnet-sdk-$Version-win-x64.zip"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "dotnet" "./app/dotnet.exe" -NoSymlink
	}
}