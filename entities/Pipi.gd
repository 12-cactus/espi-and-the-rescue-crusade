extends Node2D

onready var body: KinematicBody2D = $PipiBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Filo"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡Perdi mi Libro de Filosofia y nose que pensar de la vida!"
]
var DialogVisited = [
	"Espiiiii apurateee, quiero divagar sobre el viento y mi pelo"
]
var DialogRescued = ["Gracias Espi,\n ¡La libertad está en ser dueños de la propia vida ...!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
