extends KinematicBody2D

onready var body: AnimatedSprite = $Body

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
enum Mov { LEFT = 0, RIGHT = 0, UP = 0, DOWN = 0 }

func _ready():
	body.animation = "idle"
	body.frame = 0

func _physics_process(delta):
	get_movement_input()
	body.frame = Mov.UP + 2 * Mov.LEFT + 3 * Mov.RIGHT
	
	velocity = Vector2(Mov.RIGHT-Mov.LEFT, Mov.DOWN-Mov.UP)
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

func get_movement_input():
	Mov.UP = int(Input.is_action_pressed("up"))
	Mov.DOWN = int(Input.is_action_pressed("down"))
	Mov.LEFT = int(Input.is_action_pressed("left"))
	Mov.RIGHT = int(Input.is_action_pressed("right"))
	
func name():
	return "Soy Espi"
