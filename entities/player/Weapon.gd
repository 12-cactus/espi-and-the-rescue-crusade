extends AnimatedSprite

onready var hitbox = $Hitbox
onready var lifetime_timer = $LifeTimer
onready var sound = $AudioStreamPlayer2D

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.DOWN

func _physics_process(delta):
	global_position += direction * speed * delta

func initialize(container: KinematicBody2D, origPosition: Vector2, target: Vector2):
	container.get_parent().add_child(self)
	direction = target
	global_position = origPosition
	if target == Vector2.UP:
		rotation_degrees = 0
	if target == Vector2.DOWN:
		rotation_degrees = 180
	if target == Vector2.RIGHT:
		rotation_degrees = 90
	if target == Vector2.LEFT:
		rotation_degrees = -90

func _remove():
	get_parent().remove_child(self)
	queue_free()

func _on_Hitbox_body_entered(body):
	if body.get_name() == "Espi":
		return
	if body.has_method("notify_hit"):
		body.notify_hit()
	hitbox.collision_mask = 0
	call_deferred("_remove")
