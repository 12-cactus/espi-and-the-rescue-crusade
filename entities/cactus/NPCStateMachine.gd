class_name StateMachine extends Node

signal leave_dialog
signal show_dialog(faceset, text)

var state: int
var visits: int = 0
var parent: KinematicBody2D = null
var text: String = ""
var itemNeeded: String = "Sandwich"
var amountNeeded: int = 3
onready var faceset = load("res://assets/Actors/Markis/Faceset.png")

enum States { WAITING, RESCUED }

func initialize(parentNode: KinematicBody2D):
	parent = parentNode
	state = States.WAITING

func hasAllItems(body: KinematicBody2D) -> bool:
	return body.hasItems(itemNeeded, amountNeeded)

func handleEnterState(body: KinematicBody2D):
	if state == States.RESCUED:
		return
	
	if hasAllItems(body):
		visits += 1
		state = States.RESCUED
		text = "Gracias Espi, ¡Me salvaste!"
		emit_signal("show_dialog", faceset, text)
		return
	
	if visits <= 0:
		visits += 1
		text = "¡Espi! me robaron hasta las medias. Para poder recuperarme necesito unos sanguchitos"
		emit_signal("show_dialog", faceset, text)
		return
	
	text = "No es suficiente para recuperarme.... arrrgh me muero"
	emit_signal("show_dialog", faceset, text)

func handleExitState(body: KinematicBody2D):
	emit_signal("leave_dialog")
	if state == States.RESCUED:
		parent.dance()
