extends Node2D

onready var body: KinematicBody2D = $PipiBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Filo"

var DialogDying = [
	"¡Auxilio en nombre de Sócrates!\n\n   (Q to continue ...)",
	"Perdí mi libro de filosofía",
	"Sin mi libro no puedo cultivar mi mente",
]
var DialogVisited = [
	"Necesito salir de la caverna",
	"Necesito peinar mi barba",
	"Quiero mi libro..."
]
var DialogRescued = [
	"¡Eureka Espi!",
	"¡La libertad está en ser dueños de la propia vida!"
]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
