@{
	Name = "ssh"
	Private = $true
	Version = "-"
	Architecture = "any"
	Enable = {
		# TODO: setup permissions on ./config/keys (otherwise OpenSSH complains about too open permissions)

		# TODO: figure out how to make paths to keys relative
		#	(currently, they are hardcoded)
		Set-SymlinkedPath -IsDirectory ($HOME + "\.ssh") "./config"
	}
}

