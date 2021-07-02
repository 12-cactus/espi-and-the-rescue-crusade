extends Node2D

onready var body: KinematicBody2D = $DanBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Nunchaku"

var DialogDying = [
	"Espi escuchame una cosas\n\n   (Q to continue ...)",
	"¡Necesito que encuentres mi Nunchaku!",
	"¿Me hacés ese favor?"
]
var DialogVisited = [
	"¡Tengo que entrenar, se me hace tarde!",
	"Si no me apuro mi novia me va a retar"
]
var DialogRescued = ["Sos un groso Espi"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
