extends YSort

onready var MarkisTalk: TileMap = $MarkisTalk
onready var MarkisSaved: TileMap = $MarkisSaved
onready var AgusTalk: TileMap = $AgusTalk
onready var AgusSaved: TileMap = $AgusSaved

func on_cactus_found(faceset: String):
	var name = faceset.to_lower()
	if name.match("*markis*"):
		remove_child(MarkisTalk)
	if name.match("*agus*"):
		remove_child(AgusTalk)

func on_cactus_saved(faceset: String):
	var name = faceset.to_lower()
	if name.match("*markis*"):
		remove_child(MarkisSaved)
	if name.match("*agus*"):
		remove_child(AgusSaved)
