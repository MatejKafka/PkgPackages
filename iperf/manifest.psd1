@{
	Name = "iperf"
	Version = "3.1.3"
	Architecture = "amd64"
	Enable = {
		Export-Command "iperf" "./app/iperf3.exe" -SetWorkingDirectory
	}
}

