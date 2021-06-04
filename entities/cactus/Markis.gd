extends KinematicBody2D

onready var dialog = load("res://assets/dialog/Dialog.tscn").instance()
onready var dialog_area = $DialogArea
onready var sprite = $Sprite
var dialog_finish = false
var timesVisited = 0


func _ready():
	#dialog_area.visible = false
	add_child(dialog)
	dialog.visible = false
	sprite.animation = "idle"

func _process(delta):
	if Input.is_action_just_pressed("continue_dialog") and timesVisited == 1:
		_interact_two()
#	if Input.is_action_just_pressed("continue_dialog") and timesVisited >= 2:
#		_interact_three()

func name():
	return "soy Markis"
	
func _on_Area2D_body_entered(body):
	if body.name == "espi" and timesVisited <= 1:
		_interact_one() 
		dialog_area.visible = false
	else:
		if body.name == "espi" and timesVisited >= 2:
			_interact_three()	
		
func _interact_one():
	dialog.get_node("face").texture = load("res://assets/Actors/Markis/Faceset.png")
	dialog.get_node("text").set_text("HOla Espi tengo hambre uto")
	dialog.visible = true
	timesVisited = 1
	
func _interact_two():
	dialog.get_node("face").texture = load("res://assets/Actors/Espi/Faceset.png")
	dialog.get_node("text").set_text("dime que tiene ganas de comer")
	
func _interact_three():
	dialog.get_node("face").texture = load("res://assets/Actors/Markis/Faceset.png")
	dialog.get_node("text").set_text("DALE QUE ME CAGO DE HAMBRE")
	dialog.visible = true
	sprite.animation = "dancing"
	sprite.playing = true	
	

func dialog_state():
	dialog.visible = false

func _on_Area2D_body_exited(body):
	dialog_area.visible = true
	dialog.visible = false
	timesVisited  = timesVisited+1
	sprite.animation = "idle"
	sprite.playing = false	
