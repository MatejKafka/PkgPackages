@{
	Name = "test"
	Version = "0.0.0"
	Architecture = "*"
	
	Install = {
		echo "Install script running..."
		echo (Get-Variable)
	}
	
	Enable = {
		echo "Enable script running..."
		echo (Get-Variable)		
	}
}