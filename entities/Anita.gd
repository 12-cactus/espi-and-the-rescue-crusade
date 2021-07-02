extends Node2D

onready var body: KinematicBody2D = $AnitaBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Vodka"

var DialogDying = [
	"¡Espi!\n\n   (Q to continue ...)",
	"Perdí mi botella de Vodka y no se dónde está", 
	"¡Esto me pasa por codear en Angular!"
]
var DialogVisited = [
	"Dale Espi, tengo sed"
]
var DialogRescued = [
	"Siiii\n\n ¡¡Vamos a hacer unos tragos!!"
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
