extends MarginContainer

onready var container = $Container

var items: Array = []

func add(item: Sprite):
	var new_item: MarginContainer = MarginContainer.new()
	var texture: TextureRect = TextureRect.new()
	texture.texture = item.texture
	new_item.add_child(texture)
	new_item.set_name(item.get_name())
	container.add_child(new_item)
	items.append(new_item)
	item.remove()
	
func hasItems(anItemName, anAmountOfItems):
	var counter = 0
	for item in items:
		if item.get_name().begins_with(anItemName):
			counter = counter + 1
	return anAmountOfItems <= counter
	
func items():
	return items
