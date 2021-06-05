extends KinematicBody2D

signal leave_dialog
signal show_dialog(faceset, text)

onready var dialog_area = $DialogArea
onready var sprite = $Sprite
onready var stateMachine = $StateMachine
onready var faceset = load("res://assets/Actors/Markis/Faceset.png")

var dialog_finish = false
var mainCharacter = "Espi"
var neededItem = "Dona"
var amountOfItemsNeeded = 3
var textToShow

func _ready():
	stateMachine.initialize(self)
#	add_child(dialog)
#	dialog.visible = false
	sprite.animation = "idle"
	self.set_name("Markis")

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
		emit_signal("show_dialog", faceset, textToShow)
#		dialog.visible = true
#		dialog.get_node("face").texture = faceset
#		dialog.get_node("text").set_text(textToShow)
		dialog_area.visible = false

func _on_Area2D_body_exited(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleExitState(body)
		emit_signal("leave_dialog")
#	dialog_area.visible = true
#	dialog.visible = false
