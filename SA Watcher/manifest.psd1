@{
	Name = "SA Watcher"
	Private = $true
	Version = "-"
	Architecture = "*"
	
	Enable = {
		Assert-Dependency "nodejs"
	
		Export-Shortcut "SA Watcher" "node" -Arguments "." `
				-WorkingDirectory "D:/programming/saWatcher/out/saWatcher" `
				-IconPath "D:\programming\saWatcher\out\saWatcher\bin\icon.ico"		
	}
}

