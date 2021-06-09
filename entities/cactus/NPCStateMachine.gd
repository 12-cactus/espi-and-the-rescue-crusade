class_name StateMachine
extends Node

var state: int
var visits: int = 0
var parent: KinematicBody2D = null

enum States { WAITING, RESCUED }

func initialize(parentNode: KinematicBody2D):
	parent = parentNode
	state = States.WAITING

func hasAllItems(body: KinematicBody2D) -> bool:
	return body.hasItems(parent.neededItem(), parent.amountOfItemsNeeded())

func handleEnterState(body: KinematicBody2D):
	if state == States.RESCUED:
		return
	
	if hasAllItems(body):
		visits += 1
		state = States.RESCUED
		parent.textToShow("Gracias Espi, ¡Me salvaste!")
		return
	
	if visits <= 0:
		visits += 1
		parent.textToShow("¡Espi! me robaron hasta las medias. Para poder recuperarme necesito unos sanguchitos")
		return
	
	parent.textToShow("No es suficiente para recuperarme.... arrrgh me muero")

func handleExitState(body: KinematicBody2D):
	if state == States.RESCUED:
		parent.dance()
		parent.rescued()
