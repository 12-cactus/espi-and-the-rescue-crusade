extends Node2D

onready var body: KinematicBody2D = $JPBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Book"

var DialogDying = [
	"¡Espi!\n\n   (Q to continue ...)",
	"¡Este juego es una porquería! no me importa que sea gratis,\n",
	"no pienso dejar que esto siga hasta que no me traigan el libro de quejas"
]
var DialogVisited = [
	"Apura, no tengo todo el día",
	"Mas tardas más me voy a quejar..."
]
var DialogRescued = ["Gracias pero,\n ¡podrías haberlo traído más rápido!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
