extends Node2D

onready var body: KinematicBody2D = $DamiBody

export (Texture) var faceset = null

var amount_needed: int = 1
var item_needed: String = "Bike"

var DialogDying = [
	"¡AIIIIIUUUUDA!\n\n   (Q to continue ...)",
	 "Espi me pegue un palo haciendo un truco con la bici \n", 
	 "y la perdi"
]

var DialogVisited = [
	"Traeme la bici por favor",
	"Te prometo que no vuelvo a intentarlo"
]
var DialogRescued = ["Iupii, ya Puedo ir al hospital"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
