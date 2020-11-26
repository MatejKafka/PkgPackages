@{
	Name = "test2"
	Architecture = "x64"

	Version = "0.0.0"
	
	Install = {}
	
	Enable = {
		Assert-File ./app/test.cmd {"echo test2"}
		Export-Command "test" "./app/test.cmd" -NoSymlink
		Export-Command "test2" "./app/test.cmd" -NoSymlink
	}
}