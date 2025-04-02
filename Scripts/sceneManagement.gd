class_name SceneManager
extends Resource

@export var testScene0:String = "res://TestScene/locations/TestSceneLevel1.tscn"
@export var testSceneAttic:String = "res://TestScene/locations/TestSceneLevel1Attic.tscn"
@export var testSceneBasement:String = "res://TestScene/locations/testSceneLevel1Basement.tscn"

@export var entrance:int = 0

# Translates a scene nickname into a scene path
# input: String, scene name
# returns: String, scene path
func getScene ( sceneName:String ) -> String:
	match sceneName:
		"testSceneLevel1":
			return testScene0
		"testSceneLevel1Attic":
			return testSceneAttic
		"testSceneLevel1Basement":
			return testSceneBasement
		_:
			print("Scene" + sceneName + "Not Found")
			return ""
