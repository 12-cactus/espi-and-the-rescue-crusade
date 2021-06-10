class_name CactusDefeatedStateMachine extends Node

signal leave_dialog
signal show_dialog(faceset, text)

var state: int
var visits: int = 0
var text: String = ""
var faceset = null
var amountNeeded: int = 3
var itemNeeded: String = ""
var parent: KinematicBody2D = null

enum States {
	DYING,
	VISITED,
	RESCUED
}

func initialize(parentNode: KinematicBody2D, item: String, amount: int, facesetPath: String):
	parent = parentNode
	state = States.DYING
	itemNeeded = item
	amountNeeded = amount
	faceset = load(facesetPath)

func hasAllItems(body: KinematicBody2D) -> bool:
	return body.hasItems(itemNeeded, amountNeeded)

func handleEnterState(body: KinematicBody2D):
	if state == States.RESCUED:
		return
	
	if state == States.VISITED and hasAllItems(body):
		state = States.RESCUED
		text = "Gracias Espi, ¡Me salvaste!"
		emit_signal("show_dialog", faceset, text)
		return
	
	if state == States.DYING:
		state = States.VISITED
		text = "¡Espi! me robaron hasta las medias. Para poder recuperarme necesito unos sanguchitos"
		emit_signal("show_dialog", faceset, text)
		return

	# else
	text = "No es suficiente para recuperarme.... arrrgh me muero"
	emit_signal("show_dialog", faceset, text)

func handleExitState(_body: KinematicBody2D):
	emit_signal("leave_dialog")
	if state == States.RESCUED:
		parent.dance()
