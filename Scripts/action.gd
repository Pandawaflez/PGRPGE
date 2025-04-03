class_name Action
extends Node2D

# Action Name:
@export var actionName:= "Action"
# conditions:

# results:
@export var playAnimation:bool = false
@export var animationName := ""
@export var changeLocation:bool = false
@export var nextLocation:Location
@export var changeScene:bool = false
@export var sceneName:String = ""
@export var nextSceneEntrance:int = 0
@export var alternateNextLocation:Location
@export var checkValue:bool = false
@export var valueName:String = "testValue"
@export var valueFrom:String = "progression"

func getName():
	return actionName
