extends Sprite

var collectable_name: String = "Sandwich"
var player_over: KinematicBody2D = null

func _physics_process(delta):
	if player_over != null && get_parent().visible && Input.is_action_just_pressed("pick_up"):
		player_over.picked(self)

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		player_over = body

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		player_over = null

func remove():
	set_physics_process(false)
	get_parent().remove_child(self)
	queue_free()
	
