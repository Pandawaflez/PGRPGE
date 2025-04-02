class_name Location
extends Node2D

@onready var animationPlayer = $AnimationPlayer
@export var locName := "Location Name" 
@export_multiline var locDesc := "LocDesc"

@export var basePosX:float
@export var basePosY:float

@export var skipToNext:bool = false

@onready var actionW:Action = $ActionW
@onready var actionA:Action = $ActionA
@onready var actionS:Action = $ActionS
@onready var actionD:Action = $ActionD
@onready var actionE:Action = $ActionE
@onready var actionQ:Action = $ActionQ
@onready var action1:Action = $Action1
@onready var action2:Action = $Action2
@onready var action3:Action = $Action3
@onready var action4:Action = $Action4
@onready var action5:Action = $Action5
@onready var action6:Action = $Action6
@onready var action7:Action = $Action7
@onready var action8:Action = $Action8
@onready var action9:Action = $Action9
@onready var action0:Action = $Action0

func getAction( action:String ) -> Action:
	if ( action == "w" ):
		return actionW
	if ( action == "a" ):
		return actionA
	if ( action == "s" ):
		return actionS
	if ( action == "d" ):
		return actionD
	if ( action == "e" ):
		return actionE
	if ( action == "q" ):
		return actionQ
	if ( action == "1" ):
		return action1
	if ( action == "2" ):
		return action2
	if ( action == "3" ):
		return action3
	if ( action == "4" ):
		return action4
	if ( action == "5" ):
		return action5
	if ( action == "6" ):
		return action6
	if ( action == "7" ):
		return action7
	if ( action == "8" ):
		return action8
	if ( action == "9" ):
		return action9
	if ( action == "0" ):
		return action0
	print ( "Action value |" + action + "| not found." )
	return null
