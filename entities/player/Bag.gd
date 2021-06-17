extends Node

var items: Array = []

func add(item: Sprite):
	items.append(item)
	item.get_parent().remove_child(item)
	
func hasItems(anItemName, anAmountOfItems):
	var amount = 0
	for item in items:
		print(item.get_name())
		if item.get_name().begins_with(anItemName):
			amount += 1
	return amount >= anAmountOfItems

