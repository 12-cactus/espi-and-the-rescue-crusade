extends KinematicBody2D

onready var body: AnimatedSprite = $Body
onready var Bag: MarginContainer = $Bag

onready var dead_timer = $DeadTimer

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var item_picked: Sprite = null
var direction:Vector2 = Vector2.DOWN
enum Mov { LEFT = 0, RIGHT = 0, UP = 0, DOWN = 0 }

func _ready():
	Bag.visible = false
	body.animation = "idle"
	body.frame = 0
	name="espi"

func _physics_process(delta):
	get_movement_input()
	get_events_input()
	get_actions_input()
	fire()	
	if Bag.visible:
		return
	
	if item_picked != null:
		Bag.add(item_picked)
		item_picked = null
	
	
	velocity = Vector2(Mov.RIGHT-Mov.LEFT, Mov.DOWN-Mov.UP)
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

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
	
#	print(self.get_events_input())

func get_actions_input():
	if Input.is_action_just_pressed("bag"):
		Bag.visible = not Bag.visible

func name():
	return "Soy Espi"
	
func bag():
	return Bag
	
func fire():
	if Input.is_action_just_pressed("fire"):
		var arm=load("res://entities/arms/barrette.tscn").instance()	
		arm.initialize(self, global_position, direction)

	
func notify_hit():
	body.frame = 4
	dead_timer.connect("timeout", self, "_on_dead_timer_timeout")
	dead_timer.start()

func _on_dead_timer_timeout():
	call_deferred("_remove")

func _remove():
	set_physics_process(false)
	hide()
	collision_layer = 0
