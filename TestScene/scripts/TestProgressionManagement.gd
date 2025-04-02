class_name TestProgressionManagement
extends ProgressionManagement

@export var testValue:int = 0

func getValue( value:String ) -> int:
	print("Test Prog Manager is getting value:" + value)
	match value:
		"testValue":
			return testValue
		_: # default
			print("This is the Test Progression Progression Manager")
			return testValue

func setValue( value: String , new:int ):
	print("Setting Value" + value + "in Prog Manager to:" + str(new) ) 
