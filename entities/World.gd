extends Node2D

signal start
signal intro
signal credits
signal post_credits

var started: bool = false
var intro_started: bool = false
var show_credits: bool = false
var show_post_credits: bool = false

func _physics_process(delta):
	if started and self.get_parent().GUI._are_all_cactus_saved() and not show_credits:
		self.get_parent().start_game_won_music()
		show_credits = true
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
	if show_credits and Input.is_action_just_pressed("start") and not show_post_credits:
		emit_signal("credits")
		show_post_credits = true
		return
	if show_post_credits and Input.is_action_just_pressed("start"):
		emit_signal("post_credits")
		return

func on_cactus_found(_faceset: String, item: String):
	get_node("Items/" + item).visible = true
