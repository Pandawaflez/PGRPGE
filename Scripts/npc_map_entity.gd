class_name NPCMapEntity
extends MapEntity

@export var isIdleMoving:bool = false
@export var idleMovementScript:Array[Direction] = []
@export var idleMovementDelay:float = 1.0
var idleMovementStage:int = 0
@onready var idle_movement_timer: Timer = $IdleMovementTimer

func _ready():
	if isIdleMoving:
		idle_movement_timer.wait_time = idleMovementDelay
		idle_movement_timer.start()

func idleMovement():
	if isIdleMoving:
		idle_movement_timer.start()
		var success:bool = try_move( 1 , idleMovementScript[idleMovementStage] )
		if success:
			# incrament and clamp stage:
			idleMovementStage += 1
			if idleMovementStage >= idleMovementScript.size():
				idleMovementStage = 0
	return
