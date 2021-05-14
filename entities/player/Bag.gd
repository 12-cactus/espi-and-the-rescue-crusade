extends MarginContainer

onready var container = $Container

var items: Array = []

func add(item: Sprite):
	var new_item: MarginContainer = MarginContainer.new()
	var texture: TextureRect = TextureRect.new()
	texture.texture = item.texture
	new_item.add_child(texture)
	container.add_child(new_item)
	item.remove()

func hasItem(item: Sprite):
	for item in items:
		pass

func items():
	return items
