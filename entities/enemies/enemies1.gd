extends KinematicBody2D
onready var dialog = load("res://assets/dialog/Dialog.tscn").instance()

func _ready():
	dialog.visible = false
	add_child(dialog)

func _process(delta):
	if Input.is_action_just_pressed("continue_dialog"):
		_interact()

func _interact():
	dialog.get_node("face").texture = load("res://assets/Actors/Espi/Faceset.png")
	dialog.get_node("text").set_text("JAMAS UTOOO")
			
func _on_Area2D_body_entered(body):
		if body.name == "espi":
			dialog.visible = true
			dialog.get_node("face").texture = load("res://entities/enemies/Faceset.png")
			dialog.get_node("text").set_text("Espi Entrega l amorfi o te cabe el botellaso de quilmes gato ")



func _on_Area2D_body_exited(body):
	dialog.visible = false

