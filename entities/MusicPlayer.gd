extends AudioStreamPlayer

onready var tween = $Tween
onready var BackgroundMusic = load("res://assets/sound/Background.mp3")
onready var GameOver = load("res://assets/sound/GameOver.wav")
const BASE_VOLUME = -10
const MUTE_VOLUME = -60


func _on_music_changed(song):
	if song == null:
		stream = null #BackgroundMusic
		play()
	
	if stream == song:
		return
		
	if song != null:
		stream = song
		reset_sound()
		play()

func reset_sound():
	tween.stop_all()
	volume_db = BASE_VOLUME

func play_game_over():
	self._on_music_changed(GameOver)

func fade_out():
	tween.interpolate_property(self,"volume_db",BASE_VOLUME,MUTE_VOLUME,1.4,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	

