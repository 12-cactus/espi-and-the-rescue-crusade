extends CanvasLayer

onready var LifeBar = $LifeBar
onready var Start: TextureRect = $Start
onready var Restart: TextureRect = $Restart
onready var WindowFrame: TextureRect = $WindowFrame

func _on_World_start():
	show()

func show():
	Start.visible = false
	Restart.visible = false
	LifeBar.visible = true
	WindowFrame.visible = true

func on_player_hit(damage):
	LifeBar.life -= damage

func on_player_dead():
	Start.visible = false
	Restart.visible = true
	LifeBar.visible = false
	WindowFrame.visible = false

func on_player_revive():
	show()
