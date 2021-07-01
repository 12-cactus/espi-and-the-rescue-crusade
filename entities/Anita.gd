extends Node2D

onready var body: KinematicBody2D = $AnitaBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Vodka"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"! Perdi mi botella de vodka y nose donde ESTA\n", 
	"¡Esto me pasa por codear en ANGULAR!"
]
var DialogVisited = [
	"Espiiiii apurateee TENGO SED",
	"Arrrgh...#!#"
]
var DialogRescued = ["Gracias Espi,\n ¡ME SALVASTE!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
