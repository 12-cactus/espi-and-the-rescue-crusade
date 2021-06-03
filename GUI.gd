extends CanvasLayer

onready var life_bar = $LifeBar
onready var Start: TextureRect = $Start
onready var WindowFrame: TextureRect = $WindowFrame

func _on_World_start():
	show()

func show():
	Start.visible = false
	WindowFrame.visible = true
