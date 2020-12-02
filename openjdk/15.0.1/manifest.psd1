@{
	Name = "openjdk"
	Architecture = "x64"

	Version = "15.0.1"
	_Hash = "0A27C733FC7CEAAAE3856A9C03F5E2304AF30A32DE6B454B8762EC02447C5464"
	
	Install = {
		$Url = "https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_windows-x64_bin.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "java" "./app/bin/java.exe" -NoSymlink
		Export-Command "javaw" "./app/bin/javaw.exe" -NoSymlink
		Export-Command "javac" "./app/bin/javac.exe" -NoSymlink
		
		# TODO: should we set JAVA_HOME?
	}
}