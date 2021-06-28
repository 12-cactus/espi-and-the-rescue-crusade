extends Node

onready var TrackFader := $TrackFader
onready var FirstTrack := $FirstTrack
onready var SecondTrack := $SecondTrack


func crossfade_to(audio_stream: AudioStream) -> void:
	if FirstTrack.playing and SecondTrack.playing:
		return

	if SecondTrack.playing:
		FirstTrack.stream = audio_stream
		FirstTrack.play()
		TrackFader.play("FadeToFirstTrack")
	else:
		SecondTrack.stream = audio_stream
		SecondTrack.play()
		TrackFader.play("FadeToSecondTrack")
