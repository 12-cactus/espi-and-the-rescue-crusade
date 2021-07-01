extends Node

onready var GUI: CanvasLayer = $GUI
onready var World: Node2D = $World
onready var LifeBar: Control = $GUI/LifeBar
onready var Espi: KinematicBody2D = $Espi
onready var Locks: YSort = $World/Conurban/Locks
onready var MusicPlayer = $MusicPlayer

var format_node = "World/Cactus/{name}/{name}Body/StateMachine"
var Cactus = [
  "Markis",
  "Agus",
  "Dami",
  "Saba",
  "Dan",
  "Alan",
  "JP",
  "Pipi",
  "Anita",
  "Maru",
]

func _ready():
	MusicPlayer.play_intro_music()
	Espi.connect("hit", GUI, "on_player_hit")
	Espi.connect("item_collected", GUI, "on_item_collected")
	
	for name in Cactus:
		var cactus = get_node(format_node.format({"name": name}))
		cactus.connect("show_dialog", GUI, "on_show_dialog")
		cactus.connect("leave_dialog", GUI, "on_leave_dialog")
		cactus.connect("saved_cactus", GUI, "on_cactus_saved")
		cactus.connect("consume_items", GUI, "on_items_consumed")
		cactus.connect("cactus_found", GUI, "on_cactus_found")
		cactus.connect("cactus_found", Locks, "on_cactus_found")
		cactus.connect("saved_cactus", Locks, "on_cactus_saved")
		cactus.connect("cactus_found", World, "on_cactus_found")
	
	LifeBar.connect("dead", Espi, "death")
	LifeBar.connect("dead", GUI, "on_player_dead")
	LifeBar.connect("revive", Espi, "revive")
	LifeBar.connect("revive", GUI, "on_player_revive")

func stop_intro_music():
	MusicPlayer.play_first_level_music()

func start_intro_music():
	MusicPlayer.play_story_music()
	
func start_game_won_music():
	MusicPlayer.play_game_won_music()
	
func play_game_over():
	MusicPlayer.play_game_over()
