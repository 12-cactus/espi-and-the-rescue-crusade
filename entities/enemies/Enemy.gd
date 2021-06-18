extends KinematicBody2D

onready var body: AnimatedSprite = $Body
onready var dead_timer: Timer = $DeadTimer
onready var life_bar: TextureProgress = $LifeBar
onready var weapon: PackedScene = load("res://entities/weapons/bottle.tscn")

var count: int = 0
var enemy: KinematicBody2D = null

func _ready():
	body.frame = 0

func _process(delta):
	if count != 0:
		count -=1
	if enemy != null and enemy.isAlive() and count == 0:
		fire()

func fire():
	$Sound_fire.play()
	weapon.instance().initialize(self, global_position, global_position.direction_to(enemy.global_position))
	count = 200

func _on_Area2D_body_entered(body):
	if body.name == "Espi":
		enemy = body

func _on_Area2D_body_exited(body):
	enemy = null

func notify_hit():
	life_bar.value -= 10
	if !life_bar.value:
		death()

func death():
	set_physics_process(false)
	set_process(false)	
	$AudioStreamPlayer2D.play()
	body.frame = 4
	dead_timer.connect("timeout", self, "_on_dead_timer_timeoutt")
	dead_timer.start()
	

func _on_dead_timer_timeoutt():
	call_deferred("_remove")
	
func _remove():
	set_physics_process(false)
	set_process(false)	
	get_parent().remove_child(self)
	queue_free()
