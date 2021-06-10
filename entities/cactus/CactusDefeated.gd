extends KinematicBody2D

onready var sprite: AnimatedSprite = $Sprite
onready var State: CactusDefeatedStateMachine = $StateMachine

var espi_name: String = "Espi"
var dialog_finish: bool = false
var espi: KinematicBody2D = null

func _ready():
	set_physics_process(false)

func initialize(faceset: Resource, item_needed: String, amount_needed: int):
	State.initialize(
		self,
		faceset,
		item_needed,
		amount_needed
	)
	sprite.animation = "idle"
	set_physics_process(true)

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
