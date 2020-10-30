@{
	Name = "git"
	Version = "2.28.0"
	Architecture = "x64"
	Install = {
		$Version = $Pkg_Manifest.Version
		$Url = "https://github.com/git-for-windows/git/releases/download/v${Version}.windows.1/PortableGit-${Version}-64-bit.7z.exe"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		$PostInstallPath = "./app/post-install.bat"
		if (Test-Path $PostInstallPath) {
			echo "Running git post-install.bat..."
			& $PostInstallPath
		}
		
		Assert-Directory "./config"
		
		Export-Command "git" "./.manifest/git_wrapper.cmd" -NoSymlink
		Export-Command "gitk" "./.manifest/gitk_wrapper.cmd" -NoSymlink
	}
}