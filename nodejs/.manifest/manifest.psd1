@{
	Name = "nodejs"
	Version = "14.3.0"
	Architecture = "amd64"
	
	Install = {
		$Version = $Pkg_Manifest.Version
		$Url = "https://nodejs.org/dist/v${Version}/node-v${Version}-win-x64.zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./cache"
		Assert-Directory "./cache/npm-cache"
		
		Assert-File "./config/npmrc" -DefaultContent {
			echo ("prefix=" + (Resolve-Path "./data"))
			echo ("cache=" + (Resolve-Path "./cache/npm-cache"))
		}
	
		Export-Command "node" "./app/node.exe"
		Export-Command "npm" "./.manifest/npm_wrapper.cmd" -NoSymlink
		Export-Command "npx" "./app/npx.cmd" -NoSymlink
	}
}

