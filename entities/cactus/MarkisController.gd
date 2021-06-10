extends Node2D

onready var body: KinematicBody2D = $MarkisBody
onready var faceset: Resource = load("res://assets/Actors/MarkisFaceset.png")

var amount_needed: int = 3
var item_needed: String = "Sandwich"

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
