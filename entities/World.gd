extends Node2D

signal start
signal intro

var started: bool = false
var intro_started: bool = false

func _physics_process(delta):
	if started and not intro_started and Input.is_action_just_pressed("start"):
		self.get_parent().stop_intro_music()
		emit_signal("intro")
		intro_started = true
		return
	if not started and Input.is_action_just_pressed("start"):
		self.get_parent().start_intro_music()
		emit_signal("start")
		started = true
		return
