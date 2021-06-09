extends KinematicBody2D

onready var sprite = $Sprite
onready var stateMachine: StateMachine = $StateMachine

var dialog_finish: bool = false
var mainCharacter: String = "Espi"

func _ready():
	stateMachine.initialize(self)
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
