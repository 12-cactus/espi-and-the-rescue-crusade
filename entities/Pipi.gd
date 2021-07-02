extends Node2D

onready var body: KinematicBody2D = $PipiBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Filo"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡Perdí mi Libro de filosofía y no se qué pensar de la vida!"
]
var DialogVisited = [
	"Necesito cultivar mi mente y peinar mi barba"
]
var DialogRescued = ["Espi,\n ¡La libertad está en ser dueños de la propia vida...!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
