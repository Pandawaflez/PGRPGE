extends Node2D

@export var currentLocation:Location
var currentLocationData:LocationData

#@onready var animationPlayer = $Animation_Player

func _ready():
	# load location data:
	currentLocationData = currentLocation.locationData
	# print current location data to console:
	printLocationData()

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
		if ( currentLocation.actionW != null ):
			print(currentLocation.actionW.actionName)
	if ( input == "a" ):
		if ( currentLocation.actionA != null ):
			print(currentLocation.actionA.actionName)
	if ( input == "s" ):
		if ( currentLocation.actionS != null ):
			print(currentLocation.actionS.actionName)
	if ( input == "d" ):
		if ( currentLocation.actionD != null ):
			print(currentLocation.actionD.actionName)
	if ( input == "e" ):
		if ( currentLocation.actionE != null ):
			print(currentLocation.actionE.actionName)
	if ( input == "q" ):
		if ( currentLocation.actionQ != null ):
			print(currentLocation.actionQ.actionName)
	if ( input == "1" ):
		if ( currentLocation.action1 != null ):
			print(currentLocation.action1.actionName)
	if ( input == "2" ):
		if ( currentLocation.action2 != null ):
			print(currentLocation.action2.actionName)
	if ( input == "3" ):
		if ( currentLocation.action3 != null ):
			print(currentLocation.action3.actionName)
	if ( input == "4" ):
		if ( currentLocation.action4 != null ):
			print(currentLocation.action4.actionName)
	if ( input == "5" ):
		if ( currentLocation.action5 != null ):
			print(currentLocation.action5.actionName)
	if ( input == "6" ):
		if ( currentLocation.action6 != null ):
			print(currentLocation.action6.actionName)
	if ( input == "7" ):
		if ( currentLocation.action7 != null ):
			print(currentLocation.action7.actionName)
	if ( input == "8" ):
		if ( currentLocation.action8 != null ):
			print(currentLocation.action8.actionName)
	if ( input == "9" ):
		if ( currentLocation.action9 != null ):
			print(currentLocation.action9.actionName)
	if ( input == "0" ):
		if ( currentLocation.action0 != null ):
			print(currentLocation.action0.actionName)
# print current location and its data:
func printLocationData():
	# print name of location
	print(currentLocationData.locationName)
	# print current location navigation:
	if (currentLocationData.w != ""):
		print("w: " + currentLocationData.w)
	if (currentLocationData.a != ""):
		print("a: " + currentLocationData.a)
	if (currentLocationData.s != ""):
		print("s: " + currentLocationData.s)
	if (currentLocationData.d != ""):
		print("d: " + currentLocationData.d)
	# location Q and E interactions:
	if (currentLocationData.e != ""):
		print("e: " + currentLocationData.e)
	if (currentLocationData.q != ""):
		print("q: " + currentLocationData.q)
	# number interactions:
	if (currentLocationData.one != ""):
		print("1: " + currentLocationData.one)
	if (currentLocationData.two != ""):
		print("2: " + currentLocationData.two )
	if (currentLocationData.three != ""):
		print("3: " + currentLocationData.three)
	if (currentLocationData.four != ""):
		print("4: " + currentLocationData.four)
	if (currentLocationData.five != ""):
		print("5: " + currentLocationData.five)
	if (currentLocationData.six != ""):
		print("6: " + currentLocationData.six)
	if (currentLocationData.seven != ""):
		print("7: " + currentLocationData.seven)
	if (currentLocationData.eight != ""):
		print("8: " + currentLocationData.eight)
	if (currentLocationData.nine != ""):
		print("9: " + currentLocationData.nine)
	if (currentLocationData.zero != ""):
		print("0: " + currentLocationData.zero)
