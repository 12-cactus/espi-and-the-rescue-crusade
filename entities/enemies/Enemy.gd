extends KinematicBody2D

onready var bodyy: AnimatedSprite = $Body
onready var dead_timer = $DeadTimer
onready var Audio = $AudioStreamPlayer2D

var count = 0
var enemy = null

func _ready():
	bodyy.frame = 0

func _process(delta):
	if count != 0:
		count -=1
	if enemy != null and count == 0:
		fire()

func fire():
	var bottle=load("res://entities/arms/bottle.tscn").instance()
	bottle.initialize(self, global_position, global_position.direction_to(enemy.global_position))
	count = 200

func _on_Area2D_body_entered(body):
	if body.name == "Espi":
		enemy = body

func _on_Area2D_body_exited(body):
	enemy = null

func notify_hit():
	bodyy.frame = 4
	dead_timer.connect("timeout", self, "_on_dead_timer_timeout")
	dead_timer.start()

func _on_dead_timer_timeout():
	call_deferred("_remove")
	
func _remove():
	get_parent().remove_child(self)
	queue_free()
