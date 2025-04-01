extends Control

@onready var locationDescriptionBox:RichTextLabel


func setLocationData():
	var locationString := ""
	locationString = constructLocationString()
	if (locationDescriptionBox == null):
		print("Error.  No loc desc box to print to")
		return 
	locationDescriptionBox.Text = locationString
	return

func constructLocationString():
	var locStr := ""
	return locStr
