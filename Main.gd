extends Node

onready var GUI: CanvasLayer = $GUI
onready var LifeBar: Control = $GUI/LifeBar
onready var Espi: KinematicBody2D = $Espi
onready var Locks: YSort = $World/Conurban/Locks

onready var Markis: CactusDefeatedStateMachine = $World/Cactus/Markis/MarkisBody/StateMachine
onready var Agus: CactusDefeatedStateMachine = $World/Cactus/Agus/AgusBody/StateMachine
onready var Dami: CactusDefeatedStateMachine = $World/Cactus/Dami/DamiBody/StateMachine
onready var Saba: CactusDefeatedStateMachine = $World/Cactus/Saba/SabaBody/StateMachine
onready var Dan: CactusDefeatedStateMachine = $World/Cactus/Dan/DanBody/StateMachine

onready var IntroMusic = load("res://assets/sound/Intro.ogg")
onready var StoryMusic = load("res://assets/sound/StoryTelling.ogg")
onready var MusicPlayer = $MusicPlayer
onready var CollectableSandwich = $World/Sandwiches/Sandwich

func _ready():
	MusicPlayer._on_music_changed(IntroMusic)
	Espi.connect("hit", GUI, "on_player_hit")
	Espi.connect("item_collected", GUI, "on_item_collected")
	
	for cactus in [Markis, Agus, Dami, Saba, Dan]:
		cactus.connect("show_dialog", GUI, "on_show_dialog")
		cactus.connect("leave_dialog", GUI, "on_leave_dialog")
		cactus.connect("saved_cactus", GUI, "on_cactus_saved")
		cactus.connect("consume_items", GUI, "on_items_consumed")
		cactus.connect("cactus_found", Locks, "on_cactus_found")
		cactus.connect("saved_cactus", Locks, "on_cactus_saved")
	
	LifeBar.connect("dead", Espi, "death")
	LifeBar.connect("dead", GUI, "on_player_dead")
	LifeBar.connect("revive", Espi, "revive")
	LifeBar.connect("revive", GUI, "on_player_revive")

func stop_intro_music():
	MusicPlayer._on_music_changed(null)

func start_intro_music():
	MusicPlayer._on_music_changed(StoryMusic)
	
func play_game_over():
	MusicPlayer.play_game_over()
