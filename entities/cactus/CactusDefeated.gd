extends KinematicBody2D

onready var sprite = $Sprite
onready var stateMachine: CactusDefeatedStateMachine = $StateMachine

export var faceset: String = ""
export var item_needed: String = ""
export var amount_needed: int = 0

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
	
func dance():
	sprite.animation = "dancing"
	sprite.playing = true

func _on_Area2D_body_entered(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleEnterState(body)

func _on_Area2D_body_exited(body):
	if body.get_name() == mainCharacter:
		stateMachine.handleExitState(body)
