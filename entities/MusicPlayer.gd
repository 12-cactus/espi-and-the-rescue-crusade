extends AudioStreamPlayer

onready var tween = $Tween
onready var IntroMusic = load("res://assets/sound/Intro.ogg")
onready var StoryMusic = load("res://assets/sound/StoryTelling.ogg")
onready var BackgroundMusic = load("res://assets/sound/First Level.ogg")
onready var GameOver = load("res://assets/sound/GameOver.wav")

const BASE_VOLUME = -10
const MUTE_VOLUME = -60


func _on_music_changed(song):
	if song == null:
		stream = BackgroundMusic
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
	
func play_first_level_music():
	self._on_music_changed(null)

func play_intro_music():
	self._on_music_changed(IntroMusic)
	
func play_story_music():
	self._on_music_changed(StoryMusic)

func play_game_over():
	self._on_music_changed(GameOver)
