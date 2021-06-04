class_name StateMachine
extends Node

var state
var parent

enum States{
	IDLE,
	VISITED,
	RESCUED
}


func _ready():
	set_physics_process(false)
	
func initialize(parentNode):
	parent = parentNode
	state = States.IDLE
	set_physics_process(true)


func handleEnterState(body):
	if state == States.IDLE:
		parent.textToShow("¡Espi! me robaron hasta las medias. Para poder recuperarme necesito unos sanguchitos")
		
	if state == States.VISITED and not body.hasItems(parent.neededItem(), parent.amountOfItemsNeeded()):
		parent.textToShow("No es suficiente para recuperarme.... arrrgh me muero")
	
	if state == States.VISITED and 	body.hasItems(parent.neededItem(), parent.amountOfItemsNeeded()):
		parent.textToShow("Gracias Espi, ¡Me salvaste!")
		
func handleExitState(body):
	if state == States.IDLE:
		state = States.VISITED
		
	if state == States.VISITED and 	body.hasItems(parent.neededItem(), parent.amountOfItemsNeeded()):
		state = States.RESCUED
		
	if state == States.RESCUED:
		parent.dance()
		
