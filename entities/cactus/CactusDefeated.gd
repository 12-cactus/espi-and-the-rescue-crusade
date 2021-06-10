extends KinematicBody2D

onready var sprite = $Sprite
onready var State: CactusDefeatedStateMachine = $StateMachine

export var faceset: String = ""
export var item_needed: String = ""
export var amount_needed: int = 0

var espi: KinematicBody2D = null
var espi_name: String = "Espi"
var dialog_finish: bool = false

func _ready():
	State.initialize(
		self,
		item_needed,
		amount_needed,
		"res://assets/Actors/" + faceset + ".png"
	)
	sprite.animation = "idle"

func _physics_process(delta):
	if espi != null and Input.is_action_just_pressed("next_dialog"):
		State.next_dialog(espi)

func dance():
	sprite.animation = "dancing"
	sprite.playing = true

func _on_Area2D_body_entered(body):
	if body.get_name() == espi_name:
		espi = body
		State.handleEnterState(body)

func _on_Area2D_body_exited(body):
	if body.get_name() == espi_name:
		espi = null
		State.handleExitState(body)
