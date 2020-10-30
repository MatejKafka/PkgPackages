@{
	Name = "iperf"
	Version = "3.1.3"
	Architecture = "x64"
	Enable = {
		Export-Command "iperf" "./app/iperf3.exe" -SetWorkingDirectory
	}
}

