extends Node2D

onready var body: KinematicBody2D = $FakeMarkisBody
onready var faceset: Resource = load("res://assets/Actors/FakeMarkis.png")

var amount_needed: int = 4
var item_needed: String = "Sandwich"

var DialogDying = [
	"Tocá de acá careta!\n\n   (Q to continue ...)",
	"Que te vayas Gil!"
]
var DialogVisited = ["Sos boludo? Andate!"]
var DialogRescued = ["AN-DA-TE"]

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
	body.State.DialogDying = DialogDying
	body.State.DialogVisited = DialogVisited
	body.State.DialogRescued = DialogRescued
