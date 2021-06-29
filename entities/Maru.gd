extends Node2D

onready var body: KinematicBody2D = $MaruBody

export (Texture) var faceset = null

var amount_needed: int = 2
var item_needed: String = "Michis"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡El viento me abrió la puerta y se escaparon Ivar y Feli,\n Por favor ayudame a encontrarlos!"
]
var DialogVisited = [
	"Ivar ¿Donde estas?\n ¡Felipe! tengo pollito, Feli Feli...",
	"Espiiiii apurateee"
]
var DialogRescued = ["Gracias Espi,\n ¡Encontraste a mis Michis!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
