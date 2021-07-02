extends VBoxContainer

export (Texture) var Face = null
export (String) var Name = null

func _ready():
	$Center/Face.texture = Face
	$Label.text = Name
