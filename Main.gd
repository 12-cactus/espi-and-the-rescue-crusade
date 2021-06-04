extends Node

onready var GUI = $GUI
onready var LifeBar = $GUI/LifeBar
onready var Espi: KinematicBody2D = $Espi

func _ready():
	Espi.connect("hit", GUI, "on_player_hit")
	LifeBar.connect("dead", Espi, "death")
