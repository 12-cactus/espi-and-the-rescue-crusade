extends KinematicBody2D

signal leave_dialog
signal show_dialog(faceset, text)

onready var sprite = $Sprite
onready var stateMachine = $StateMachine
onready var faceset = load("res://assets/Actors/Markis/Faceset.png")

var dialog_finish: bool = false
var mainCharacter: String = "Espi"
var itemNeeded: String = "Sandwich"
var amountNeeded: int = 3
var is_rescued: bool = false
var text: String = ""

func _ready():
	stateMachine.initialize(self)
	sprite.animation = "idle"
	set_name("Markis")

func rescued():
	is_rescued = true

func textToShow(aTexToBeDisplayed):
	text = aTexToBeDisplayed
	
func neededItem():
	return itemNeeded
	
func amountOfItemsNeeded():
	return amountNeeded
	
func dance():
	sprite.animation = "dancing"
	sprite.playing = true

func _on_Area2D_body_entered(body):
	if is_rescued:
		return
	if body.get_name() == mainCharacter:
		stateMachine.handleEnterState(body)
		emit_signal("show_dialog", faceset, text)

func _on_Area2D_body_exited(body):
	if is_rescued:
		return
	if body.get_name() == mainCharacter:
		stateMachine.handleExitState(body)
		emit_signal("leave_dialog")
