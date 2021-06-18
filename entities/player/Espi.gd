extends KinematicBody2D

signal hit(damage)
signal item_collected(name)

onready var body: AnimatedSprite = $Body
onready var Bag: Node = $Bag
onready var Weapon: PackedScene = load("res://entities/player/Weapon.tscn")
onready var ShotEffect: AudioStreamPlayer2D = $Player_attack
onready var SoundHurt: AudioStreamPlayer2D = $Player_hurt
onready var ItemPickedSound: AudioStreamPlayer2D = $Item_Picked

var speed: int = 100
var velocity: Vector2 = Vector2.ZERO
var item_picked: Sprite = null
var direction:Vector2 = Vector2.DOWN
var alive
enum Mov { LEFT = 0, RIGHT = 0, UP = 0, DOWN = 0 }

func _ready():
	alive = true
	self.set_name("Espi")
	yield(get_tree().root, "ready")
	body.animation = "idle_down"

func _physics_process(_delta):
	get_movement_input()
	fire()

	
	if item_picked != null:
		Bag.add(item_picked)
		item_picked = null
	
	velocity = Vector2(Mov.RIGHT-Mov.LEFT, Mov.DOWN-Mov.UP)
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

func in_dialog(is_in_dialog: bool):
	if is_in_dialog:
		body.playing = false
		if direction == Vector2.UP:
			body.animation = "idle_up"
		if direction == Vector2.DOWN:
			body.animation = "idle_down"
		if direction == Vector2.LEFT:
			body.animation = "idle_left"
		if direction == Vector2.RIGHT:
			body.animation = "idle_right"
	set_physics_process(not is_in_dialog)

func picked(item: Sprite):
	item_picked = item
	ItemPickedSound.play()
	emit_signal("item_collected", item.collectable_name)

func get_movement_input():
	Mov.UP =    int(Input.is_action_pressed("up"))
	Mov.DOWN =  int(Input.is_action_pressed("down"))
	Mov.LEFT =  int(Input.is_action_pressed("left"))
	Mov.RIGHT = int(Input.is_action_pressed("right"))
	
	if Input.is_action_just_released("up"):
		body.playing = false
		body.animation = "idle_up"
	if Input.is_action_just_released("down"):
		body.playing = false
		body.animation = "idle_down"
	if Input.is_action_just_released("left"):
		body.playing = false
		body.animation = "idle_left"
	if Input.is_action_just_released("right"):
		body.playing = false
		body.animation = "idle_right"
	
	if Mov.UP:
		direction = Vector2.UP
		body.playing = true
		body.play("walk_up")
	if Mov.DOWN:
		direction = Vector2.DOWN
		body.playing = true
		body.play("walk_down")
	if Mov.LEFT:
		direction = Vector2.LEFT
		body.playing = true
		body.play("walk_left")
	if Mov.RIGHT:
		direction = Vector2.RIGHT
		body.playing = true
		body.play("walk_right")

func bag():
	return Bag
	
func fire():
	if Input.is_action_just_pressed("fire"):
		Weapon.instance().initialize(self, global_position, direction)
		ShotEffect.play()

func notify_hit():
	SoundHurt.play()
	emit_signal("hit", 2)

func death():
	alive = false
	get_parent().play_game_over()
	call_deferred("_remove")

func revive():
	alive = true
	position = Vector2(293.213, 258.349)
	body.frame = 0
	collision_layer = 1
	get_parent().stop_intro_music()
	show()
	set_physics_process(true)

func _on_dead_timer_timeout():
	call_deferred("_remove")

func _remove():
	set_physics_process(false)
	hide()
	collision_layer = 0

func hasItems(anItemName, anAmountOfItems):
	return Bag.hasItems(anItemName, anAmountOfItems) 

func isAlive():
	return alive
