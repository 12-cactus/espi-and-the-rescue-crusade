extends Node2D

onready var body: KinematicBody2D = $DamiBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Bike"

var DialogDying = [
	"¡Qué onda perro!\n\n   (Q to continue ...)",
	"Escuchame, me pegue un palo con la bici",
	"Me estaba haciendo el bicivolador pero me la di en la pera",
	"Ahora no sé dónde quedó"
]

var DialogVisited = [
	"Traeme la bici por favor",
	"Te juro que es la última vez que lo intento. La espalda ya no me da..."
]
var DialogRescued = [
	"¡Vamos canejo! Me voy volando al hospital"
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
