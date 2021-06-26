extends YSort

onready var MarkisTalk: TileMap = $MarkisTalk
onready var MarkisSaved: TileMap = $MarkisSaved

func on_cactus_found(name):
	if name.match("*Markis*"):
		remove_child(MarkisTalk)

func on_cactus_saved(name):
	if name.match("*Markis*"):
		remove_child(MarkisSaved)
