extends KinematicBody2D

var speed: int = 200

func _physics_process(delta) -> void:
	move_and_slide(get_new_velocity())

func get_new_velocity() -> Vector2:
	var new_velocity: Vector2 = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")),
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	)
	return new_velocity.normalized() * speed
