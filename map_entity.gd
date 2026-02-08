class_name MapEntity
extends CharacterBody2D

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

func interact( _from: MapEntity ) -> void:
	print("Entity interacted with.")

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
