extends KinematicBody2D

signal hit(damage)

onready var body: AnimatedSprite = $Body
onready var Bag: Node = $Bag

var speed: int = 150
var velocity: Vector2 = Vector2.ZERO
var item_picked: Sprite = null
var direction:Vector2 = Vector2.DOWN
enum Mov { LEFT = 0, RIGHT = 0, UP = 0, DOWN = 0 }

func _ready():
	yield(get_tree().root, "ready")
	body.animation = "idle"
	body.frame = 0
	self.set_name("Espi")

func _physics_process(delta):
	get_movement_input()
	get_events_input()
	fire()
	
	if item_picked != null:
		Bag.add(item_picked)
		item_picked = null
	
	velocity = Vector2(Mov.RIGHT-Mov.LEFT, Mov.DOWN-Mov.UP)
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

func in_dialog(is_in_dialog: bool):
	set_physics_process(not is_in_dialog)

func picked(item: Sprite):
	item_picked = item

func get_movement_input():
	Mov.UP =    int(Input.is_action_pressed("up"))
	Mov.DOWN =  int(Input.is_action_pressed("down"))
	Mov.LEFT =  int(Input.is_action_pressed("left"))
	Mov.RIGHT = int(Input.is_action_pressed("right"))
	if Mov.UP:
		self.direction = Vector2.UP
		body.frame = 1
	if Mov.DOWN:
		self.direction = Vector2.DOWN
		body.frame = 0
	if Mov.RIGHT:
		self.direction = Vector2.RIGHT
		body.frame = 3
	if Mov.LEFT:
		self.direction = Vector2.LEFT
		body.frame = 2

func get_events_input():
	var collect_item: bool = Input.is_action_just_pressed("pick_up")
	
func bag():
	return Bag
	
func fire():
	if Input.is_action_just_pressed("fire"):
		var arm=load("res://entities/arms/barrette.tscn").instance()	
		arm.initialize(self, global_position, direction)

func notify_hit():
	emit_signal("hit", 2)

func death():
	call_deferred("_remove")

func revive():
	position = Vector2(112, 330)
	body.frame = 0
	collision_layer = 1
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
