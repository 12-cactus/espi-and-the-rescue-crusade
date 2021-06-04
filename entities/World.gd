extends Node2D

signal start

func _physics_process(delta):
	if Input.is_action_pressed("start"):
		emit_signal("start")
