class_name ProgressionManagement
extends Node

@export var isGlobalProgressionManager:bool = false
@export var progressionDictionary:Dictionary = {}

func getProgValue( value:String ):
	print("Retrieving Prog value " , value )
	if progressionDictionary.get(value) == null:
		print( "Prog value " , value , "not found" )
		if isGlobalProgressionManager:
			var mapManager = get_tree().get_first_node_in_group("map_manager")
			return mapManager.getProgValue(value)
		else:
			return -1
	return progressionDictionary.get(value)

func setProgValue( value:String , newVal: int ):
	print("Setting Value " + value + " in Prog Manager to:" + str(newVal) )
	progressionDictionary[value] = newVal
	var mapManager = get_tree().get_first_node_in_group("map_manager")
	if mapManager != null:
		mapManager.updateProgression()
	else:
		print("ERROR: Map manager not found when trying to update progression")

"""
# Check if the value from a given data source is the same as a particular int
# input:
#	value we want to compare
#	source of this value
#	what we want to compare it with
# output:
#	true: values are the same
#	false: values are different, or source not found
func checkProgression( value:String , from:String , comparison:int ) -> bool:
	print("Checking if Progression value |" + str(value) + "| + |" + str(from) + "| is equal to |" + str(comparison) + "|")
	var valueNum:int
	if ( from == "progression" ):
		print("value is from Progression")
		valueNum = getProgValue(value)
		if ( valueNum == comparison ):
			return true
		else:
			return false
	else:
		print("could not properly check value.")
		print("Data Source: |" + from + "| not found.")
		return false"""
