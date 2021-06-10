extends Node2D

signal start

var started: bool = false

func _physics_process(delta):
	if not started and Input.is_action_pressed("start"):
		emit_signal("start")
		started = true
