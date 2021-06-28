extends Node2D

onready var body: KinematicBody2D = $AlanBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Mac"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡necesito que encuentres mi MAC!"
]
var DialogVisited = [
	"Espiiiii apurateee TENGO QUE CODEAR CHETO EN MI MAC",
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
