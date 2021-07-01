extends YSort

func on_cactus_found(faceset: String, _item: String):
	var name = faceset.to_lower()
	if name.match("*markis*"):
		remove_child($MarkisTalk)
	if name.match("*agus*"):
		remove_child($AgusTalk)

func on_cactus_saved(faceset: String, _item: String):
	var name = faceset.to_lower()
	if name.match("*markis*"):
		remove_child($MarkisSaved)
	if name.match("*agus*"):
		remove_child($AgusSaved)
	if name.match("*dami*"):
		remove_child($DamiSaved)
