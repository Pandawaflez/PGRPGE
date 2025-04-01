class_name SceneManager
extends Resource

@export var testScene0:String = "res://TestScene/locations/TestSceneLevel1.tscn"
@export var testSceneAttic:String = "res://TestScene/locations/TestSceneLevel1Attic.tscn"
@export var testSceneBasement:String = ""

func getScene ( sceneName:String ) -> String:
	match sceneName:
		"testSceneLevel1":
			return testScene0
		"testSceneLevel1Attic":
			return testSceneAttic
		_:
			print("Scene" + sceneName + "Not Found")
			return ""
