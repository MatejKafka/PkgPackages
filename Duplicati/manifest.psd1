@{
	Name = "Duplicati"
	Version = "2.0.5.1_beta"
	Architecture = "x64"

	Install = {
		# download zip from website
		# unzip to app
	}

	Enable = {
		Export-Command "duplicati" "./app/Duplicati.CommandLine.exe" -NoSymlink
	}
}

