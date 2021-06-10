extends Node2D

onready var body: KinematicBody2D = $FakeMarkisBody
onready var faceset: Resource = load("res://assets/Actors/FakeMarkis.png")

var amount_needed: int = 4
var item_needed: String = "Sandwich"

func _ready():
	body.initialize(
		faceset,
		item_needed,
		amount_needed
	)
