extends KinematicBody2D

const WALK_SPEED = 25

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
	body.frame = 0

func _process(delta):
	if count != 0:
		count -=1
	if enemy != null and count == 0:
		fire()
		
func _physics_process(delta):
	if flag:
		var direction = (player.global_position - global_position).normalized()
		move_and_slide(direction * WALK_SPEED)

func fire():
	weapon.instance().initialize2(self, global_position, global_position.direction_to(enemy.global_position), "res://assets/arms/rock.png")
	AudioPlayer.play()
	count = 100

func _on_Area2D_body_entered(body):
	if body.name == "Espi":
		enemy = body
		flag = true
		$Combat.play()

func _on_Area2D_body_exited(body):
	enemy = null
	$Combat.stop()
	flag = false
	
func notify_hit():
	life_bar.value -= 10
	if !life_bar.value:
		death()
	

func death():
	AudioPlayer.stream = DeadSound
	AudioPlayer.play()
	body.frame = 4
	dead_timer.connect("timeout", self, "_on_dead_timer_timeout")
	dead_timer.start()

func _on_dead_timer_timeout():
	call_deferred("_remove")
	
func _remove():
	get_parent().remove_child(self)
	queue_free()
