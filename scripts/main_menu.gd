extends Control

func _ready():
	MusicManager.play_music("menu")
	MusicManager.current_track.volume_db = -8

func _on_salir_pressed():
	get_tree().quit()
