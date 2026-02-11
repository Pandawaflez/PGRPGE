class_name PlayerMapEntity
extends MapEntity

@export var move_tiles := 1
@export var hold_delay := 0.25

var held_direction: Direction
var move_timer: Timer

func _ready() -> void:
	move_timer = Timer.new()
	move_timer.wait_time = hold_delay
	move_timer.one_shot = false
	add_child(move_timer)
	move_timer.timeout.connect(_on_move_timer_timeout)
	add_to_group("map_entities")
	return

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		_try_interact()
	elif event.is_action_pressed("Up"):
		_start_move(Direction.UP)
	elif event.is_action_pressed("Down"):
		_start_move(Direction.DOWN)
	elif event.is_action_pressed("Left"):
		_start_move(Direction.LEFT)
	elif event.is_action_pressed("Right"):
		_start_move(Direction.RIGHT)
	elif event.is_action_released("Up") \
	or event.is_action_released("Down") \
	or event.is_action_released("Left") \
	or event.is_action_released("Right"):
		_stop_move()
	return

func _try_interact() -> void:
	var dir_vec := _direction_to_vector(facing)
	var check_pos := global_position + dir_vec * TILE_SIZE
	for entity in get_tree().get_nodes_in_group("map_entities"):
		if entity == self:
			continue
		if entity.global_position == check_pos:
			entity.interact(self)
			return

func _start_move(direction: Direction) -> void:
	held_direction = direction
	try_move(move_tiles, direction)
	if move_timer.is_stopped():
		move_timer.start()
	return

func _stop_move() -> void:
	move_timer.stop()
	return

func _on_move_timer_timeout() -> void:
	if is_moving:
		return
	if !_is_direction_held():
		_stop_move()
		return
	try_move(move_tiles, held_direction)

func _is_direction_held() -> bool:
	match held_direction:
		Direction.UP:
			return Input.is_action_pressed("Up")
		Direction.DOWN:
			return Input.is_action_pressed("Down")
		Direction.LEFT:
			return Input.is_action_pressed("Left")
		Direction.RIGHT:
			return Input.is_action_pressed("Right")
		_:
			return false
