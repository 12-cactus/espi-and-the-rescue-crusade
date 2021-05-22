extends Area2D

var speed=200
var velocity=Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x=speed*delta
	translate(velocity)
