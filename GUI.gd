extends CanvasLayer

onready var life_bar = $LifeBar
onready var Start: TextureRect = $Start
onready var Legend: Label = $Legend
onready var WindowFrame: TextureRect = $WindowFrame

func _on_World_start():
	show()

func show():
	Start.visible = false
	Legend.visible = true
	WindowFrame.visible = true
