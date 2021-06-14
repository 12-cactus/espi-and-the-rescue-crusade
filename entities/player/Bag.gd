extends Node

var items: Array = []

func add(item: Sprite):
	items.append(item)
	item.get_parent().remove_child(item)
	
func hasItems(anItemName, anAmountOfItems):
	var amount = 0
	for item in items:
		if item.get_name() == anItemName:
			amount += 1
	return amount >= anAmountOfItems

