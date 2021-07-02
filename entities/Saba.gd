extends Node2D

onready var body: KinematicBody2D = $SabaBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Passport"

var DialogDying = [
	"¡Espi por favor!\n\n   (Q to continue ...)",
	"¡Necesito que encuentres mi pasaporte!",
	"Sin mi pasaporte no puedo irme a Canada!",
	"¡¡Ya van 3 veces que Dami me lo esconde!!",
	"¡¡Encontralo por favor!!"
]
var DialogVisited = ["¡¡Dale que me cancelan el viaje!!"]
var DialogRescued = ["¡Ay si! Sabakuskas sale para Ezeiza"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
