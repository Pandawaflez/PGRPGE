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
	if event.is_action_pressed("a"):
		print("a pressed")
	if event.is_action_pressed("s"):
		print("s pressed")
	if event.is_action_pressed("d"):
		print("d pressed")
	if event.is_action_pressed("e"):
		print("e pressed")
	if event.is_action_pressed("q"):
		print("q pressed")
	if event.is_action_pressed("1"):
		print("1 pressed")
	if event.is_action_pressed("2"):
		print("2 pressed")
	if event.is_action_pressed("3"):
		print("3 pressed")
	if event.is_action_pressed("4"):
		print("4 pressed")
	if event.is_action_pressed("5"):
		print("5 pressed")
	if event.is_action_pressed("6"):
		print("6 pressed")
	if event.is_action_pressed("7"):
		print("7 pressed")
	if event.is_action_pressed("8"):
		print("8 pressed")
	if event.is_action_pressed("9"):
		print("9 pressed")
	if event.is_action_pressed("0"):
		print("0 pressed")

func performLocationAction(  ):
	pass

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
