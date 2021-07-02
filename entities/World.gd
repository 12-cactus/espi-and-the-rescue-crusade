extends Node2D

signal start
signal intro
signal credits

var started: bool = false
var showCredits: bool = false
var intro_started: bool = false

func _physics_process(delta):
	if started and self.get_parent().GUI._are_all_cactus_saved() and not showCredits:
		self.get_parent().start_game_won_music()
		showCredits = true
		return
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
	if showCredits and Input.is_action_just_pressed("start"):
		emit_signal("credits")
		return

func on_cactus_found(_faceset: String, item: String):
	get_node("Items/" + item).visible = true
