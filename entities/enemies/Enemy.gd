extends KinematicBody2D

onready var body: AnimatedSprite = $Body
onready var dead_timer: Timer = $DeadTimer
onready var life_bar: TextureProgress = $LifeBar
onready var weapon: PackedScene = load("res://entities/weapons/bottle.tscn")

var count: int = 0
var enemy: KinematicBody2D = null
var dead: bool = false

func _ready():
	body.frame = 0

func _physics_process(delta):
	if count != 0:
		count -=1
	if enemy != null and enemy.isAlive() and count == 0:
		fire()
		var direction = (enemy.global_position - global_position).normalized()
		if direction.x >= 0 && direction.y >= 0:
			body.frame = 3
		if direction.x >= 0 && direction.y < 0:
			body.frame = 1
		if direction.x < 0 && direction.y >= 0:
			body.frame = 0
		if direction.x < 0 && direction.y < 0:
			body.frame = 2

func fire():
	$Sound_fire.play()
	weapon.instance().initialize(self, global_position, global_position.direction_to(enemy.global_position))
	count = 200

func _on_Area2D_body_entered(_enemy):
	if _enemy.name == "Espi":
		enemy = _enemy

func _on_Area2D_body_exited(body):
	enemy = null

func notify_hit():
	if not dead:
		life_bar.value -= 10
		if !life_bar.value:
			death()

func death():
	set_physics_process(false)
	set_process(false)
	$CollisionShape2D.visible = false
	dead = true
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
