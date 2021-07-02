extends Node2D

onready var body: KinematicBody2D = $AlanBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Mac"

var DialogDying = [
	"¡No encuentro mi MAC!\n\n   (Q to continue ...)",
	"¡Ayudame a encontrarla!"
]
var DialogVisited = [
	"Tengo que terminar de laburar",
]
var DialogRescued = ["Ahora si puedo ver unos Laracasts"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
