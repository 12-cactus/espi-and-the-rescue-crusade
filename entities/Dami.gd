extends Node2D

onready var body: KinematicBody2D = $DamiBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Bike"

var DialogDying = [
	"¡AIIIIIUUUUDA!\n\n   (Q to continue ...)",
	 "Espi me pegue un palo jugando a ser BiciVolador \n y perdi la bici", 
	  "necesito que la encuntres"
]

var DialogVisited = [
	"Espiiiii apurateee QUIERO MI BICIII",
	"Arrrgh...#!#"
]
var DialogRescued = ["Gracias Espi, ¡ya Puedo volcer a ser un BiciVolador!"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
