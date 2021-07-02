extends Node2D

onready var body: KinematicBody2D = $MaruBody

export (Texture) var faceset = null

var amount_needed: int = 2
var item_needed: String = "Michis"

var DialogDying = [
	"¡Espi!\n\n   (Q to continue ...)",
	"¡El viento me abrió la puerta y se escaparon Ivar y Feli,\n Por favor ayudame a encontrarlos!"
]
var DialogVisited = [
	"Ivar ¿Dónde estas?",
	"¡Felipe! tengo pollito, Feli Feli..."
]
var DialogRescued = ["¡Encontraste a mis Michis! \n ¡Gracias!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
