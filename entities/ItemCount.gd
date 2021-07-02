extends HBoxContainer

export (Texture) var texture = null

func _ready():
	$Item.texture = texture
