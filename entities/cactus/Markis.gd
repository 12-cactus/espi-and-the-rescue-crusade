extends KinematicBody2D

onready var dialog_area = get_node("DialogArea")
#onready var dialog2 = get_node("Dialog2")
var dialog
var dialog_finish = false

var timesVisited = 0

func _ready():
	dialog2.visible = false

func _process(delta):
	if Input.is_action_just_pressed("continue_dialog"):
		_interact()

func name():
	return "soy Markis"

func _interact():
	dialog.get_node("face").texture = load("res://assets/Actors/Espi/Faceset.png")
	dialog.get_node("text").set_text("dime que tiene ganas de comer")

func _on_Area2D_body_entered(body):
	if body.name == "espi":
		dialog = load("res://assets/dialog/Dialog.tscn").instance()
		add_child(dialog)
		dialog.get_node("face").texture = load("res://assets/Actors/Markis/Faceset.png")
		dialog.get_node("text").set_text("HOla Espi tengo hambre uto")
		dialog_area.visible = false
		dialog.visible = true
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
	dialog.visible = false
