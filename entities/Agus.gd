extends Node2D

onready var body: KinematicBody2D = $AgusBody
onready var faceset: Resource = load("res://assets/Actors/Markis/Faceset.png")

var amount_needed: int = 3
var item_needed: String = "Wine"

var DialogDying = [
	"¡AIUDA!"
]
var DialogVisited = [
	"No es suficiente para recuperarme...",
	"Arrrgh me mueroooo"
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
