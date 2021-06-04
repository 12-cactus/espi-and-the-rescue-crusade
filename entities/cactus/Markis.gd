extends KinematicBody2D

onready var dialog = load("res://assets/dialog/Dialog.tscn").instance()
onready var dialog_area = $DialogArea
onready var sprite = $Sprite
onready var stateMachine = $StateMachine

var dialog_finish = false
var mainCharacter = "Espi"
var neededItem = "Dona"
var amountOfItemsNeeded = 3
var textToShow


func _ready():
	stateMachine.initialize(self)
	add_child(dialog)
	dialog.visible = false
	sprite.animation = "idle"
	self.set_name("Markis")

func _process(delta):
	pass
	
func dialog_state():
	dialog.visible = false

func textToShow(aTexToBeDisplayed):
	textToShow = aTexToBeDisplayed
	
func neededItem():
	return neededItem
	
func amountOfItemsNeeded():
	return amountOfItemsNeeded
	
func animation():
	return sprite
	
func dance():
	sprite.animation = "dancing"
	sprite.playing = true

func _on_Area2D_body_entered(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleEnterState(body)
		dialog.visible = true
		dialog.get_node("face").texture = load("res://assets/Actors/Markis/Faceset.png")
		dialog.get_node("text").set_text(textToShow)
		dialog_area.visible = false

func _on_Area2D_body_exited(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleExitState(body)
	dialog_area.visible = true
	dialog.visible = false
