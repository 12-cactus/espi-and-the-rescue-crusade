extends Node2D

onready var body: KinematicBody2D = $DanBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Nunchaku"

var DialogDying = [
	"¡Espi dame una mano!\n\n   (Q to continue ...)",
	"¡necesito que encuentres mi Nunchaku!"
]
var DialogVisited = [
	"Tengo que entrenar y se me hace tarde",
	"Si no me apuro mi novia me va a retar"
]
var DialogRescued = ["Sos groso Espi"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
