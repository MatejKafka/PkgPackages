@{
	Name = "CMake"
	Version = "3.19.0-rc1"
	Architecture = "x64"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/Kitware/CMake/releases/download/v$Version/cmake-$Version-win64-x64.zip"
		Install-FromUrl $Url
	}
	
	Enable = {
		Export-Command "cmake" "./app/bin/cmake.exe"
		Export-Command "cpack" "./app/bin/cpack.exe"
		Export-Command "ctest" "./app/bin/ctest.exe"
		Export-Command "cmcldeps" "./app/bin/cmcldeps.exe"
		
		Export-Shortcut "CMake (cmake-gui)" "./app/bin/cmake-gui.exe"
	}
}