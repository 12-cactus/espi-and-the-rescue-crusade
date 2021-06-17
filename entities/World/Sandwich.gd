extends Sprite

var player_over: KinematicBody2D = null
onready var PickedEffect: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _physics_process(delta):
	self.set_name("Sandwich")
	if player_over != null && Input.is_action_just_pressed("pick_up"):
		player_over.picked(self)

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		player_over = body

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		player_over = null

func remove():
	play_picked_effect()
	get_parent().remove_child(self)
	queue_free()

func play_picked_effect():
	PickedEffect.play()
