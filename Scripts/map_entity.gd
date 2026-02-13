class_name MapEntity
extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var hasProgressionTrigger:bool = false
@export var progressionTriggerArray:Array[String] = []
@export var progressionValueArray:Array[int] = []

@export var hasInteractionEffects:bool = false
@export var interactionEffectArray:Array[String] = []
@export var interactionEffectValueArray:Array[String] = []

const TILE_SIZE := 64
const MOVE_TIME := 0.15

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

var is_moving := false

var facing: Direction = Direction.DOWN

func _ready():
	add_to_group("map_entities")

func disable():
	collision_shape_2d.disabled = true
	hide()
	return

func enable():
	collision_shape_2d.disabled = false
	show()
	return

func calculateProgressionTrigger() -> void:
	if not hasProgressionTrigger:
		return
	print("Calculating progression trigger")
	var counter:int = 0
	var counterCap:int = progressionTriggerArray.size()
	if counterCap >= progressionValueArray.size():
		counterCap = progressionValueArray.size()
	print("Array size: " , counterCap )
	while counter < counterCap:
		if is_same( ProgressionManager.getProgValue( progressionTriggerArray[counter] ) , progressionValueArray[counter] ):
			enable()
		else:
			disable()
		counter += 1
	return

func interact( _from: MapEntity ) -> void:
	print("Entity interacted with.")
	var counter:int = 0
	while counter < interactionEffectArray.size():
		if interactionEffectArray[counter] == "Dialogue":
			print("Doing Dialogue")
		elif interactionEffectArray[counter] == "Update Progression":
			print("Updating Progression")
			if counter+1 < interactionEffectValueArray.size():
				ProgressionManager.setProgValue(interactionEffectValueArray[counter] , int(interactionEffectValueArray[counter+1]) )
				counter += 1
			else:
				print ( "[ERROR]: unable to update Progression due to seg fault danger" )
		else:
			print("[ERROR]: Some other thing " , interactionEffectArray[counter] )
		counter += 1
func try_move(distance: int, direction: Direction) -> bool:
	facing = direction
	if is_moving:
		return false
	var dir_vector := _direction_to_vector(direction)
	var motion := dir_vector * distance * TILE_SIZE
	if !_can_move(motion):
		return false
	var target_pos := _snap_to_grid(global_position + motion)
	is_moving = true
	var tween := create_tween()
	tween.tween_property(
		self,
		"global_position",
		target_pos,
		MOVE_TIME * distance
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(func():
		is_moving = false
	)
	
	return true

func _direction_to_vector(direction: Direction) -> Vector2:
	match direction:
		Direction.UP:
			return Vector2.UP
		Direction.DOWN:
			return Vector2.DOWN
		Direction.LEFT:
			return Vector2.LEFT
		Direction.RIGHT:
			return Vector2.RIGHT
		_:
			return Vector2.ZERO

func _snap_to_grid(pos: Vector2) -> Vector2:
	return Vector2(
		(round(pos.x / TILE_SIZE) * TILE_SIZE) - 32,
		(round(pos.y / TILE_SIZE) * TILE_SIZE) - 24
	)

func _can_move(motion: Vector2) -> bool:
	return !test_move(global_transform, motion)
