extends Node2D

onready var body: KinematicBody2D = $AgusBody

export (Texture) var faceset = null

var amount_needed: int = 3
var item_needed: String = "Wine"

var DialogDying = [
	"¡AIIIIIUUUUDA!\n\n   (Q to continue ...)",
	"¡Gracias por deshacerte de ese Gerente capitalista!",
	"¡¡¡Me tenía programando en traje!!!",
	 "Traeme unos vinitos que ya es viernes"
]
var DialogVisited = [
	"Necesito mas nafta",
	"Dale Espiiiiii"
]
var DialogRescued = ["Es viernes y mi cuerpo lo sabe, aurrrrrr"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
