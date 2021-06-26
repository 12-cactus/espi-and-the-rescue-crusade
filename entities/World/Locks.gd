extends YSort

onready var MarkisTalk: TileMap = $MarkisTalk

func on_cactus_found(name):
	if name.match("*Markis*"):
		remove_child(MarkisTalk)

