extends Node2D

onready var body: KinematicBody2D = $JPBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Book"

var DialogDying = [
	"¡Espi!\n\n   (Q to continue ...)",
	"¡Este juego es una porquería!",
	"¡No me importa que sea gratis!",
	"No me voy a mover de acá hasta que no me traigan el libro de quejas"
]
var DialogVisited = [
	"Apura amigo, no tengo todo el día",
	"Mas tardás más me voy a quejar"
]
var DialogRescued = [
	"¡Gracias!",
	"Igual podrías haberlo traído más rápido"
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
