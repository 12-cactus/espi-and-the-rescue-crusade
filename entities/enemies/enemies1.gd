extends KinematicBody2D

onready var dialog = load("res://assets/dialog/Dialog.tscn").instance()
onready var bodyy: AnimatedSprite = $Body
onready var fire_timer = $FireTimer
onready var dead_timer = $DeadTimer

var count=0
var enemy = null

func _ready():
	bodyy.frame = 0
	dialog.visible = false
	add_child(dialog)

func _process(delta):
	if Input.is_action_just_pressed("continue_dialog"):
		_interact()
	if count != 0:
		count -=1
	if enemy != null and count == 0:
		fire()	
	
		

func _interact():
	dialog.get_node("face").texture = load("res://assets/Actors/Espi/Faceset.png")
	dialog.get_node("text").set_text("JAMAS UTOOO")


func fire():
	var bottle=load("res://entities/arms/bottle.tscn").instance()	
	bottle.initialize(self, global_position, global_position.direction_to(enemy.global_position))
	count= 200
				
func _on_Area2D_body_entered(body):
	if body.name == "espi":
		enemy=body
		dialog.visible = true
		dialog.get_node("face").texture = load("res://entities/enemies/Faceset.png")
		dialog.get_node("text").set_text("Espi Entrega la morfi o te cabe el botellaso de quilmes gato ")
		$AudioStreamPlayer2D.play()

func _on_Area2D_body_exited(body):
	enemy=null
	dialog.visible = false
	$AudioStreamPlayer2D.stop()

func notify_hit():
	bodyy.frame = 4
	dead_timer.connect("timeout", self, "_on_dead_timer_timeout")
	dead_timer.start()

func _on_dead_timer_timeout():
	call_deferred("_remove")
	
func _remove():
	get_parent().remove_child(self)
	queue_free()
