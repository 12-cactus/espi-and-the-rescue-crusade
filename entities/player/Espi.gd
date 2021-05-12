extends KinematicBody2D

onready var body: AnimatedSprite = $Body
onready var Bag: MarginContainer = $Bag

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
enum Mov { LEFT = 0, RIGHT = 0, UP = 0, DOWN = 0 }

func _ready():
	Bag.visible = false
	body.animation = "idle"
	body.frame = 0

func _physics_process(delta):
	get_movement_input()
	get_actions_input()
	if Bag.visible:
		return
	body.frame = Mov.UP + 2 * Mov.LEFT + 3 * Mov.RIGHT
	
	velocity = Vector2(Mov.RIGHT-Mov.LEFT, Mov.DOWN-Mov.UP)
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

func get_movement_input():
	Mov.UP = int(Input.is_action_pressed("up"))
	Mov.DOWN = int(Input.is_action_pressed("down"))
	Mov.LEFT = int(Input.is_action_pressed("left"))
	Mov.RIGHT = int(Input.is_action_pressed("right"))

func get_actions_input():
	if Input.is_action_just_pressed("bag"):
		Bag.visible = not Bag.visible
