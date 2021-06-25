extends Node2D

onready var body: KinematicBody2D = $SabaBody
onready var faceset: Resource = load("res://assets/Actors/saba/Faceset1.png")

var amount_needed: int = 3
var item_needed: String = "Wine"

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
