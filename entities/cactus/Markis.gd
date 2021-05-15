extends KinematicBody2D

var timesVisited = 0

func _ready():
	pass # Replace with function body.

func name():
	return "soy Markis"

func _on_Area2D_body_entered(body):
	if body != self:
		if timesVisited == 0:
			timesVisited = 1
			print(body.name())
		else:
			print(body.name() + " de nuevo")
			print(body.bag().items())
		
