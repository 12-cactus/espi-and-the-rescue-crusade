class_name CactusDefeatedStateMachine extends Node

signal leave_dialog
signal saved_cactus(faceset)
signal show_dialog(faceset, text)
signal consume_items(item_name, amount)

var state: int
var visits: int = 0
var faceset = null
var amountNeeded: int = 3
var itemNeeded: String = ""
var current_dialog: Array = []
var parent: KinematicBody2D = null
var dialog_position: int = 0

var DialogDying = [""]
var DialogVisited = [""]
var DialogRescued = [""]

enum States {
	DYING,
	VISITED,
	RESCUED
}

func initialize(parentNode: KinematicBody2D, facesetResource: Resource, item: String, amount: int):
	parent = parentNode
	faceset = facesetResource
	itemNeeded = item
	amountNeeded = amount
	state = States.DYING
	dialog_position = 0

func show_dialog():
	emit_signal("show_dialog", faceset, current_dialog[dialog_position])

func next_dialog(body: KinematicBody2D):
	if dialog_position == current_dialog.size() - 1:
		emit_signal("leave_dialog")
		body.in_dialog(false)
	
	if dialog_position < current_dialog.size() - 1:
		dialog_position += 1
		show_dialog()
	
	if state == States.RESCUED:
		parent.dance()
		emit_signal("saved_cactus", faceset.resource_path)
		emit_signal("consume_items", itemNeeded, amountNeeded)

func hasAllItems(body: KinematicBody2D) -> bool:
	return body.hasItems(itemNeeded, amountNeeded)

func handleEnterState(body: KinematicBody2D):
	if state == States.RESCUED:
		return
	
	body.in_dialog(true)
	
	if state == States.VISITED and hasAllItems(body):
		state = States.RESCUED
		current_dialog = DialogRescued
	
	if state == States.VISITED:
		current_dialog = DialogVisited
	
	if state == States.DYING:
		state = States.VISITED
		current_dialog = DialogDying
	
	dialog_position = 0
	show_dialog()
