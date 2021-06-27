extends Node2D

onready var body: KinematicBody2D = $DanBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Nunchaku"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡necesito que encuentres mi Nunchaku!"
]
var DialogVisited = [
	"Espiiiii apurateee TENGO QUE ENTRENAR Y MI NOVIA ME RETA",
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
