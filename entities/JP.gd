extends Node2D

onready var body: KinematicBody2D = $JPBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Book"

var DialogDying = [
	"¡Espi AYUDAMEEEE!\n\n   (Q to continue ...)",
	"¡Este juego es una porqueria! no me importa que sea gratis,\n",
	"no pienso dejar que esto siga hasta que no me traigan el libro de quejas"
]
var DialogVisited = [
	"Espiiiii apurateee TENGO QUE QUEJARMEEE",
	"Arrrgh...#!#"
]
var DialogRescued = ["Gracias Espi,\n ¡Podrias haberlo encontrado mas rapido!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
