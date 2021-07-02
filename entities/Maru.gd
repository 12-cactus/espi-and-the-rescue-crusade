extends Node2D

onready var body: KinematicBody2D = $MaruBody

export (Texture) var faceset = null

var amount_needed: int = 2
var item_needed: String = "Michis"

var DialogDying = [
	"¡Hola Espi querido!\n\n   (Q to continue ...)",
	"Estaba haciendo masa madre y se me escaparon los michis",
	"Ayudame a encontrar a Ivar y a Feli.\n¡Por favor Espi!"
]
var DialogVisited = [
	"Ivar ¿Dónde estás?",
	"¡Felipe! Tengo pollito, Feli Feli..."
]
var DialogRescued = [
	"¡Encontraste a mis chiquis, Espi!",
	"¡Gracias, sos el mejor!"
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
