@{
	Name = "TeamViewer"
	Version = "-"
	Architecture = "x64"
	
	#Install = {
		# not sure if these are ever invoked, but we don't want registry modifications
		#Remove-Item -Force "./config/TeamViewer.reg"
		#Remove-Item -Force "./config/TeamViewerHKLM.reg"
	#}
	
	Enable = {
		Set-SymlinkedPath -IsDirectory "./app/Data/settings" "./config"

		Export-Shortcut "TeamViewer" "./app/TeamViewerPortable.exe"		
	}
}

