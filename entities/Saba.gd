extends Node2D

onready var body: KinematicBody2D = $SabaBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Passport"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡necesito que encuentres mi pasaporte,\n asi puedo Viajar a Canda y hacerme el cheto!"
]
var DialogVisited = [
	"Espiiiii apurateee TENGO QUE VIAJAR",
	"Arrrgh...#!#"
]
var DialogRescued = ["Gracias Espi, ¡Me salvaste!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
