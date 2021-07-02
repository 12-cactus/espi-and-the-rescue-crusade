extends Node2D

onready var body: KinematicBody2D = $SabaBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Passport"

var DialogDying = [
	"¡Espi por favor!\n\n   (Q to continue ...)",
	"¡necesito que encuentres mi pasaporte,\n sino no puedo irme a Canada!"
]
var DialogVisited = [
	"Se me va el vuelo",
	"Mientras voy a ponerme otra campera"
]
var DialogRescued = ["¡Ay si! Ya salgo para Ezeiza"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
