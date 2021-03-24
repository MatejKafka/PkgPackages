@{
	Name = "nodejs"
	Architecture = "x64"

	Version = "14.3.0"
	_Hash = "07bebc231dd8d773ab41cdcfbcb8b48e2336fbee20deb961b4300b9ba86afa04"
	
	Install = {
		$Version = $Pkg_Manifest.Version
		$Url = "https://nodejs.org/dist/v${Version}/node-v${Version}-win-x64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./data/node"
		Assert-Directory "./data/npm"
		Assert-Directory "./cache"
		Assert-Directory "./cache/npm"
		
		# TODO: check if the current prefix and cache path is correct, even if the file exists
		Assert-File "./config/npmrc" -DefaultContent {
			echo ("prefix=" + (Resolve-Path "./data/npm"))
			echo ("cache=" + (Resolve-Path "./cache/npm"))
		}
	
		Export-Command "node" "./.manifest/node_wrapper.cmd" -NoSymlink
		Export-Command "npm" "./.manifest/npm_wrapper.cmd" -NoSymlink
		Export-Command "npx" "./app/npx.cmd" -NoSymlink
	}
}

# notes:
#  optional dependendency
#	- git (allows downloading modules from git repo)
#		- can be set explicitly with `npm config set git <path-to-git.exe>`