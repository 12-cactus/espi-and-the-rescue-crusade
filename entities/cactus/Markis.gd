extends KinematicBody2D

onready var dialog_area = get_node("DialogArea")
onready var dialog2 = get_node("Dialog2")

var timesVisited = 0

func _ready():
	dialog2.visible = false

func name():
	return "soy Markis"

func _on_Area2D_body_entered(body):
	if body.name == "espi":
		dialog_area.visible = false
		dialog2.visible = true
		print(body.name)

    if body != self:
		if timesVisited == 0:
			timesVisited = 1
			print(body.name())
		else:
			print(body.name() + " de nuevo")
			print(body.bag().items())
		
func _on_Area2D_body_exited(body):
	dialog_area.visible = true
	dialog2.visible = false
