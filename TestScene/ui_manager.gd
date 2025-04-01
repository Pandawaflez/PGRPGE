class_name UIManager
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
	if (currLoc.actionA != null ):
		locStr += "A: " + currLoc.getAction("a").getName() + "\n"#
	if (currLoc.actionS != null ):
		locStr += "S: " + currLoc.getAction("s").getName() + "\n"
	if (currLoc.actionD != null ):
		locStr += "D: " + currLoc.getAction("d").getName() + "\n"
	if (currLoc.actionE != null ):
		locStr += "E: " + currLoc.getAction("e").getName() + "\n"
	if (currLoc.actionQ != null ):
		locStr += "Q: " + currLoc.getAction("q").getName() + "\n"
	if (currLoc.action1 != null ):
		locStr += "1: " + currLoc.getAction("1").getName() + "\n"
	if (currLoc.action2 != null ):
		locStr += "2: " + currLoc.getAction("2").getName() + "\n"
	if (currLoc.action3 != null ):
		locStr += "3: " + currLoc.getAction("3").getName() + "\n"
	if (currLoc.action4 != null ):
		locStr += "4: " + currLoc.getAction("4").getName() + "\n"
	if (currLoc.action5 != null ):
		locStr += "5: " + currLoc.getAction("5").getName() + "\n"
	if (currLoc.action6 != null ):
		locStr += "6: " + currLoc.getAction("6").getName() + "\n"
	if (currLoc.action7 != null ):
		locStr += "7: " + currLoc.getAction("7").getName() + "\n"
	if (currLoc.action8 != null ):
		locStr += "8: " + currLoc.getAction("8").getName() + "\n"
	if (currLoc.action9 != null ):
		locStr += "9: " + currLoc.getAction("9").getName() + "\n"
	if (currLoc.action0 != null ):
		locStr += "0: " + currLoc.getAction("0").getName() + "\n"
	# print("locStr: |" + locStr + "|")
	return locStr
