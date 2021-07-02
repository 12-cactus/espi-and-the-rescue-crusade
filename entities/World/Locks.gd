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
	if name.match("*saba*"):
		remove_child($SabaSaved)
	if name.match("*jp*"):
		remove_child($JPSaved)
	if name.match("*dan*"):
		remove_child($DanSaved)
	if name.match("*anita*"):
		remove_child($AnitaSaved)
	if name.match("*pipi*"):
		remove_child($PipiSaved)

