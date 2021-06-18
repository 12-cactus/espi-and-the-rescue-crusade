extends Node

onready var GUI = $GUI
onready var LifeBar = $GUI/LifeBar
onready var Espi: KinematicBody2D = $Espi
onready var MarkisStateMachine: CactusDefeatedStateMachine = $World/Cactus/Markis/MarkisBody/StateMachine
onready var IntroMusic = load("res://assets/sound/Intro.ogg")
onready var MusicPlayer = $MusicPlayer

func _ready():
	MusicPlayer._on_music_changed(IntroMusic)
	Espi.connect("hit", GUI, "on_player_hit")
	
	MarkisStateMachine.connect("show_dialog", GUI, "on_show_dialog")
	MarkisStateMachine.connect("leave_dialog", GUI, "on_leave_dialog")
	MarkisStateMachine.connect("saved_cactus", GUI, "on_cactus_saved")
	
	LifeBar.connect("dead", Espi, "death")
	LifeBar.connect("dead", GUI, "on_player_dead")
	LifeBar.connect("revive", Espi, "revive")
	LifeBar.connect("revive", GUI, "on_player_revive")

func stop_intro_music():
	MusicPlayer._on_music_changed(null)
