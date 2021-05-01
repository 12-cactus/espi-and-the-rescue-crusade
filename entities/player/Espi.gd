extends KinematicBody2D

export (float) var ACCELERATION: float = 20.0
export (float) var H_SPEED_LIMIT: float = 600.0
export (float) var FRICTION_WEIGHT: float = 0.1

var VELOCITY: Vector2 = Vector2.ZERO
var SPEED: float = 10.0

func _physics_process(delta):
	# Player movement
	var dir: Vector2 = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")),
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	)
	if dir == Vector2.ZERO:
		VELOCITY = lerp(VELOCITY, Vector2.ZERO, 0.25)
	else:
		VELOCITY += dir * SPEED

	VELOCITY = move_and_slide(VELOCITY)
