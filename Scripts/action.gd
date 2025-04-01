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

func getName():
	return actionName
