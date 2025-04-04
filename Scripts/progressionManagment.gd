class_name ProgressionManagement
extends Resource

@export var testValue:int = 0

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
		return false

func getProgValue( value:String ) -> int :
	print("Note: this is a skeleton, you will need to write a subclass to make this functional.")
	return testValue

func setValue( value:String , from:String , newVal:int ):
	print("Setting Value" + value + "in" + from + "to:" + str(newVal) ) 
	if ( from == "progression" ): 
		setProgValue( value , newVal )
	else:
		print("Value not recognized by Progression Manager")

func setProgValue( value:String , newVal: int ):
	print("Setting Value" + value + "in Prog Manager to:" + str(newVal) )
	if ( value == "testValue" ):
		testValue = newVal
	else:
		print("Value" + value + "not recognized by Progression Manager")
