extends Node2D

@export var currentLocation:Location
var currentLocationData:LocationData

func _ready():
	currentLocationData = currentLocation.locationData
	printLocationData()

func printLocationData():
	print(currentLocationData.locationName)
