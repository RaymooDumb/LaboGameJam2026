extends Node2D

func _ready():
	MusicManager.play_music("world")
	MusicManager.current_track.volume_db = 0
