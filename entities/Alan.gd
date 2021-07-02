extends Node2D

onready var body: KinematicBody2D = $AlanBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Mac"

var DialogDying = [
	"¡Espi No encuentro mi MAC!\n\n   (Q to continue ...)",
	"No me obliguen a usar Windows de nuevo, por favor",
	"¡Ayudame a encontrarla!"
]
var DialogVisited = [
	"Dale que tengo que terminar de laburar",
	"Esos efectos de React no se programan solos"
]
var DialogRescued = [
	"¡Genial!",
	"Ahora ya puedo volver a ver unos Laracasts"
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
