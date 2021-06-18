extends KinematicBody2D

const WALK_SPEED = 30

onready var body: AnimatedSprite = $Body
onready var dead_timer: Timer = $DeadTimer
onready var life_bar: TextureProgress = $LifeBar
onready var AudioPlayer: AudioStreamPlayer2D = $AudioStreamPlayer2D
onready var weapon: PackedScene = load("res://entities/weapons/bottle.tscn")
onready var DeadSound: AudioStream = load("res://assets/sound/deadEnemy.wav")

var count: int = 0
var enemy: KinematicBody2D = null
var flag: bool = false
onready var player = get_node("/root/Main/Espi")

func _ready():
	body.animation = "idle_up"

func _process(delta):
	if count != 0:
		count -=1
	if enemy != null and count == 0:
		fire()
		
func _physics_process(delta):
	if flag:
		var direction = (player.global_position - global_position).normalized()
		move_and_slide(direction * WALK_SPEED)
		body.playing = true
		var pos = player.global_position - global_position
		if direction.x >= 0 && direction.y >= 0:
			body.animation = "walk_right"
		if direction.x >= 0 && direction.y < 0:
			body.animation = "walk_up"
		if direction.x < 0 && direction.y >= 0:
			body.animation = "walk_down"
		if direction.x < 0 && direction.y < 0:
			body.animation = "walk_left"
	else:
		body.playing = false
		if body.animation == "walk_up":
			body.animation = "idle_up"
		if body.animation == "walk_down":
			body.animation = "idle_down"
		if body.animation == "walk_left":
			body.animation = "idle_left"
		if body.animation == "walk_right":
			body.animation = "idle_right"

func fire():
	weapon.instance().initialize2(self, global_position, global_position.direction_to(enemy.global_position), "res://assets/arms/briefcase.png")
	AudioPlayer.play()
	count = 100

func _on_Area2D_body_entered(body_enter):
	if body_enter.get_name() == "Espi":
		enemy = body_enter
		flag = true
		#$Combat.play()

func _on_Area2D_body_exited(body_enter):
	enemy = null
	#$$Combat.stop()
	flag = false

func notify_hit():
	life_bar.value -= 10
	if !life_bar.value:
		death()

func death():
	set_physics_process(false)
	set_process(false)	
	body.animation = "death"
	AudioPlayer.stream = DeadSound
	AudioPlayer.play()
	dead_timer.connect("timeout", self, "_on_dead_timer_timeout")
	dead_timer.start()

func _on_dead_timer_timeout():
	call_deferred("_remove")
	
func _remove():
	set_physics_process(false)
	set_process(false)
	get_parent().remove_child(self)
	queue_free()
