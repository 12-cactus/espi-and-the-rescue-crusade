extends Node

onready var GUI: CanvasLayer = $GUI
onready var LifeBar: Control = $GUI/LifeBar
onready var Espi: KinematicBody2D = $Espi
onready var Locks: YSort = $World/Conurban/Locks

onready var MarkisStateMachine: CactusDefeatedStateMachine = $World/Cactus/Markis/MarkisBody/StateMachine
onready var AgusStateMachine: CactusDefeatedStateMachine = $World/Cactus/Agus/AgusBody/StateMachine
onready var DamiStateMachine: CactusDefeatedStateMachine = $World/Cactus/Dami/DamiBody/StateMachine
onready var SabaStateMachine: CactusDefeatedStateMachine = $World/Cactus/Saba/SabaBody/StateMachine
onready var DanStateMachine: CactusDefeatedStateMachine = $World/Cactus/Dan/DanBody/StateMachine

onready var IntroMusic = load("res://assets/sound/Intro.ogg")
onready var StoryMusic = load("res://assets/sound/StoryTelling.ogg")
onready var MusicPlayer = $MusicPlayer
onready var CollectableSandwich = $World/Sandwiches/Sandwich

func _ready():
	MusicPlayer._on_music_changed(IntroMusic)
	Espi.connect("hit", GUI, "on_player_hit")
	Espi.connect("item_collected", GUI, "on_item_collected")

	MarkisStateMachine.connect("show_dialog", GUI, "on_show_dialog")
	MarkisStateMachine.connect("leave_dialog", GUI, "on_leave_dialog")
	MarkisStateMachine.connect("saved_cactus", GUI, "on_cactus_saved")
	MarkisStateMachine.connect("consume_items", GUI, "on_items_consumed")
	MarkisStateMachine.connect("cactus_found", Locks, "on_cactus_found")
	MarkisStateMachine.connect("saved_cactus", Locks, "on_cactus_saved")
	
	AgusStateMachine.connect("show_dialog", GUI, "on_show_dialog")
	AgusStateMachine.connect("leave_dialog", GUI, "on_leave_dialog")
	AgusStateMachine.connect("saved_cactus", GUI, "on_cactus_saved")
	AgusStateMachine.connect("consume_items", GUI, "on_items_consumed")

	DamiStateMachine.connect("show_dialog", GUI, "on_show_dialog")
	DamiStateMachine.connect("leave_dialog", GUI, "on_leave_dialog")
	DamiStateMachine.connect("saved_cactus", GUI, "on_cactus_saved")
	DamiStateMachine.connect("consume_items", GUI, "on_items_consumed")
	
	SabaStateMachine.connect("show_dialog", GUI, "on_show_dialog")
	SabaStateMachine.connect("leave_dialog", GUI, "on_leave_dialog")
	SabaStateMachine.connect("saved_cactus", GUI, "on_cactus_saved")
	SabaStateMachine.connect("consume_items", GUI, "on_items_consumed")

	DanStateMachine.connect("show_dialog", GUI, "on_show_dialog")
	DanStateMachine.connect("leave_dialog", GUI, "on_leave_dialog")
	DanStateMachine.connect("saved_cactus", GUI, "on_cactus_saved")
	DanStateMachine.connect("consume_items", GUI, "on_items_consumed")
			
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
