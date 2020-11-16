@{
	Name = "mingw64"
	Version = "8.0.0"
	Architecture = "x64"
	
	Install = {
		$RepoUrl = "https://github.com/brechtsanders/winlibs_mingw"
		$Url = $RepoUrl + "/releases/download/10.2.0-11.0.0-9.0.0-r3/winlibs-x86_64-posix-seh-gcc-10.2.0-mingw-w64-8.0.0-r3.7z"
		Install-FromUrl $Url
	}
	
	Enable = {
		# TODO: when I figure out a way to sensibly support exporting a lot of commands with reasonable semantics,
		#  and or the dependency system, export all the commands from ./app/bin
		#  (currently, the best candidate seems to be to have designated bin dir, which we'll optionally scrape and copy to pkg_bin),
		echo "Nothing to do."
	}
}

