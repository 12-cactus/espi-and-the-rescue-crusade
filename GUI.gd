extends CanvasLayer

onready var LifeBar = $LifeBar
onready var Start: TextureRect = $Start
onready var Restart: TextureRect = $Restart
onready var WindowFrame: TextureRect = $WindowFrame
onready var Dialog: Sprite = $Dialog

func _ready():
	Start.visible = true
	Restart.visible = false
	LifeBar.visible = false
	WindowFrame.visible = false
	Dialog.visible = false

func _on_World_start():
	show()

func show():
	Start.visible = false
	Restart.visible = false
	LifeBar.visible = true
	WindowFrame.visible = true
	Dialog.visible = false

func on_player_hit(damage):
	LifeBar.life -= damage

func on_player_dead():
	Start.visible = false
	Restart.visible = true
	LifeBar.visible = false
	WindowFrame.visible = false

func on_player_revive():
	show()

func on_show_dialog(faceset, text):
	Dialog.get_node("face").texture = faceset
	Dialog.get_node("text").set_text(text)
	Dialog.visible = true

func on_leave_dialog():
	Dialog.get_node("text").set_text("EMPTY")
	Dialog.visible = false
