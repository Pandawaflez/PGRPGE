class_name SceneManager
extends Resource

func changeScene ( sceneName:String , currentScene:Node2D ):
	print("Changing Scene to: " + sceneName)
	match sceneName:
		"testSceneLevel1":
			pass
		"testSceneLevel1Attic":
			pass
		_:
			print("Scene" + currentScene.name + "Not Found")
			return
	currentScene.free()
