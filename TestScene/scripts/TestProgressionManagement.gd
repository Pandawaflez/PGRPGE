class_name TestProgressionManagement
extends ProgressionManagement

@export var chestQuest := 0

func getProgValue( value:String ) -> int:
	print("Test Prog Manager is getting value: " + value)
	match value:
		"testValue":
			return testValue
		_: # default
			print("This is the Test Progression Manager did not recognize the value name" + value)
			return testValue

func setProgValue( value: String , newVal:int ):
	print("Setting Value" + value + "in Test Prog Manager to:" + str(newVal) ) 
	match value:
		"testValue":
			testValue = newVal
		"chestQuest":
			chestQuest = newVal
		_: # default
			print("This is the Test Progression Progression Manager")
			return testValue
