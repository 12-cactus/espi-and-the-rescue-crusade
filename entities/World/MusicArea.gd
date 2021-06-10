extends Area2D

signal music_changed(song)

export (AudioStream) var song = null

func _ready():
	var music_player = get_tree().get_nodes_in_group("MusicPlayer")[0]
	connect("music_changed", music_player, "_on_music_changed")

func _on_body_entered(body: Node):
	if body.get_name() == "Espi":
		emit_signal("music_changed", song)

func _on_body_exited(body):
	if body.get_name() == "Espi":
		emit_signal("music_changed", null)
