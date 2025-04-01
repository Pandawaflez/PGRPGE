extends Control

@export var locationDescriptionBox:RichTextLabel
@export var navigationManager:NavigationManager

func _ready() -> void:
	setLocationData()

func setLocationData():
	var locationString := ""
	locationString = constructLocationString()
	if (locationDescriptionBox == null):
		print("Error.  No loc desc box to print to")
		return 
	locationDescriptionBox.text = locationString
	return

func constructLocationString():
	var locStr := ""
	# Get source value objects and check that they are not null:
	if ( navigationManager == null ):
		print( "Navigation Manager Not Found by UI Manager" )
		return
	var currLoc:Location = navigationManager.getCurrentLocation()
	if ( currLoc == null ):
		print("Current Location not found by UI Manager")
		return
	# construct string:
	locStr += currLoc.locName + "\n"
	locStr += currLoc.locDesc + "\n"
	if (currLoc.actionW != null ):
		locStr += "W: " + currLoc.getAction("w").getName() + "\n"
	#print("locStr: |" + locStr + "|")
	return locStr
