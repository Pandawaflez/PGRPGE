class_name NavigationManager
extends Node2D

@export var currentLocation:Location
@export var sceneEntrances:Array[Location]
@export var uIManager:UIManager
@export var playerSprite:Sprite2D
@export var sceneManager:SceneManager
@export var progressionManager:ProgressionManagement

@export var actionsAllowed:bool = true

func _ready():
	# set Location to enterance:
	var entranceIndex := sceneManager.entrance
	if ( sceneEntrances[entranceIndex] != null ):
		changeLocation(sceneEntrances[entranceIndex])
	# print current location data to console:
	printLocationData()
	playerSprite.position = Vector2(currentLocation.basePosX , currentLocation.basePosY)

func _input(event):
	if event.is_action_pressed("w"):
		print("w pressed")
		performLocationAction("w")
	if event.is_action_pressed("a"):
		print("a pressed")
		performLocationAction("a")
	if event.is_action_pressed("s"):
		print("s pressed")
		performLocationAction("s")
	if event.is_action_pressed("d"):
		print("d pressed")
		performLocationAction("d")
	if event.is_action_pressed("e"):
		print("e pressed")
		performLocationAction("e")
	if event.is_action_pressed("q"):
		print("q pressed")
		performLocationAction("q")
	if event.is_action_pressed("1"):
		print("1 pressed")
		performLocationAction("1")
	if event.is_action_pressed("2"):
		print("2 pressed")
		performLocationAction("2")
	if event.is_action_pressed("3"):
		print("3 pressed")
		performLocationAction("3")
	if event.is_action_pressed("4"):
		print("4 pressed")
		performLocationAction("4")
	if event.is_action_pressed("5"):
		print("5 pressed")
		performLocationAction("5")
	if event.is_action_pressed("6"):
		print("6 pressed")
		performLocationAction("6")
	if event.is_action_pressed("7"):
		print("7 pressed")
		performLocationAction("7")
	if event.is_action_pressed("8"):
		print("8 pressed")
		performLocationAction("8")
	if event.is_action_pressed("9"):
		print("9 pressed")
		performLocationAction("9")
	if event.is_action_pressed("0"):
		print("0 pressed")
		performLocationAction("0")

func performLocationAction( input:String ):
	if ( input == "w" ):
		performAction(currentLocation.actionW)
	if ( input == "a" ):
		performAction(currentLocation.actionA)
	if ( input == "s" ):
		performAction(currentLocation.actionS)
	if ( input == "d" ):
		performAction(currentLocation.actionD)
	if ( input == "e" ):
		performAction(currentLocation.actionE)
	if ( input == "q" ):
		performAction(currentLocation.actionQ)
	if ( input == "1" ):
		performAction(currentLocation.action1)
	if ( input == "2" ):
		performAction(currentLocation.action2)
	if ( input == "3" ):
		performAction(currentLocation.action3)
	if ( input == "4" ):
		performAction(currentLocation.action4)
	if ( input == "5" ):
		performAction(currentLocation.action5)
	if ( input == "6" ):
		performAction(currentLocation.action6)
	if ( input == "7" ):
		performAction(currentLocation.action7)
	if ( input == "8" ):
		performAction(currentLocation.action8)
	if ( input == "9" ):
		performAction(currentLocation.action9)
	if ( input == "0" ):
		performAction(currentLocation.action0)

# print current location and its data:
func printLocationData():
	print("Location: ")
	# print name of location
	print(currentLocation.locName)
	print(currentLocation.locDesc)
	#print(currentLocationData.locationName)
	# print names of the Actions:
	print("Action Data: ")
	print("W: ")
	printAction(currentLocation.actionW)
	print("A: ")
	printAction(currentLocation.actionA)
	print("S: ")
	printAction(currentLocation.actionS)
	print("D: ")
	printAction(currentLocation.actionD)
	print("E: ")
	printAction(currentLocation.actionE)
	print("Q: ")
	printAction(currentLocation.actionQ)
	print("1: ")
	printAction(currentLocation.action1)
	print("2: ")
	printAction(currentLocation.action2)
	print("3: ")
	printAction(currentLocation.action3)
	print("4: ")
	printAction(currentLocation.action4)
	print("5: ")
	printAction(currentLocation.action5)
	print("6: ")
	printAction(currentLocation.action6)
	print("7: ")
	printAction(currentLocation.action7)
	print("8: ")
	printAction(currentLocation.action8)
	print("9: ")
	printAction(currentLocation.action9)
	print("0: ")
	printAction(currentLocation.action0)

func printAction( action:Action ):
	if ( action != null ):
		print( action.actionName )
	else:
		"Cannot print action, action not found"

func performAction( action:Action ):
	if ( actionsAllowed ):
		if ( action == null ):
			print( "Error: Cannot perform, action not found." )
			print("Current Location: " + currentLocation.name )
			return
		print("Performing Action: " + action.actionName )
		#play animation:
		if ( action.playAnimation ):
			print("PlayingAnimation: " + action.animationName )
			currentLocation.animationPlayer.play(action.animationName)
		#moving:
		if ( action.checkValue ):
			if (progressionManager.checkProgression( action.valueName, action.valueFrom , action.valueTo ) ):
				changeLocation( action.nextLocation )
			else:
				changeLocation( action.alternateNextLocation )
		elif ( action.changeLocation ):
			if ( action.nextLocation == null ):
				print("Next Location could not be found")
			else:
				print("Changing Location to " + action.nextLocation.locName )
				changeLocation( action.nextLocation )
		if ( action.setValue ):
			progressionManager.setValue( action.valueName, action.valueFrom , action.valueTo )
		if ( action.changeScene ):
			sceneManager.entrance = action.nextSceneEntrance
		# Update UI:
		uIManager.setLocationData()
	else:
		print("Nav Manager cannot Perform action, actions are not allowed at this time.")

func changeLocation( loc:Location ):
	if ( loc == null ):
		print( "Nav Manager cannot change location, location does not exist." )
		return
	currentLocation = loc
	if ( currentLocation.skipToNext ):
		performAction(currentLocation.actionE)
	printLocationData()

func changeScene ( sceneName:String ):
	var scenePath:String = sceneManager.getScene(sceneName)
	print("Loading Scene from path: " + scenePath )
	get_tree().change_scene_to_file(scenePath)

func getCurrentLocation():
	return currentLocation
