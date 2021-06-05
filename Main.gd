extends Node

onready var GUI = $GUI
onready var LifeBar = $GUI/LifeBar
onready var Espi: KinematicBody2D = $Espi
onready var Markis: KinematicBody2D = $World/Friends/Markis

func _ready():
	Espi.connect("hit", GUI, "on_player_hit")
	
	Markis.connect("show_dialog", GUI, "on_show_dialog")
	Markis.connect("leave_dialog", GUI, "on_leave_dialog")
	
	LifeBar.connect("dead", Espi, "death")
	LifeBar.connect("dead", GUI, "on_player_dead")
	LifeBar.connect("revive", Espi, "revive")
	LifeBar.connect("revive", GUI, "on_player_revive")
