extends CanvasLayer

onready var LifeBar = $LifeBar
onready var Start: TextureRect = $Start
onready var WindowFrame: TextureRect = $WindowFrame

func _on_World_start():
	show()

func show():
	Start.visible = false
	LifeBar.visible = true
	WindowFrame.visible = true
