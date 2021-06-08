extends KinematicBody2D

signal leave_dialog
signal show_dialog(faceset, text)

onready var sprite = $Sprite
onready var stateMachine = $StateMachine
onready var faceset = load("res://assets/Actors/Markis/Faceset.png")

var dialog_finish = false
var mainCharacter = "Espi"
var itemNeeded = "Sandwich"
var amountNeeded = 3
var text

func _ready():
	stateMachine.initialize(self)
	sprite.animation = "idle"
	self.set_name("Markis")

func textToShow(aTexToBeDisplayed):
	text = aTexToBeDisplayed
	
func neededItem():
	return itemNeeded
	
func amountOfItemsNeeded():
	return amountNeeded
	
func animation():
	return sprite
	
func dance():
	sprite.animation = "dancing"
	sprite.playing = true

func _on_Area2D_body_entered(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleEnterState(body)
		emit_signal("show_dialog", faceset, text)

func _on_Area2D_body_exited(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleExitState(body)
		emit_signal("leave_dialog")
