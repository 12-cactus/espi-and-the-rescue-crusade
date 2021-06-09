extends KinematicBody2D

onready var sprite = $Sprite
onready var stateMachine: StateMachine = $StateMachine

export var faceset: String = "MarkisFaceset"
export var item_needed: String = "Sandwich"
export var amount_needed: int = 3

var dialog_finish: bool = false
var mainCharacter: String = "Espi"

func _ready():
	stateMachine.initialize(
		self,
		item_needed,
		amount_needed,
		"res://assets/Actors/" + faceset + ".png"
	)
	sprite.animation = "idle"
	set_name("Markis")
	
func dance():
	sprite.animation = "dancing"
	sprite.playing = true

func _on_Area2D_body_entered(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleEnterState(body)

func _on_Area2D_body_exited(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleExitState(body)
