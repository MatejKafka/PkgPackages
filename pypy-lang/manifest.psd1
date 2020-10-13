@{
	Name = "pypy-lang"
	Version = "3.6-v7.3.1"
	Architecture = "x86"
	Enable = {
		Export-Command "pypy" "./app/pypy3.exe" -NoSymlink
	}
}

