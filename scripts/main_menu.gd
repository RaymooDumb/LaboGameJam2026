extends Control

func _ready():
	MusicManager.play_music("menu")
	MusicManager.current_track.volume_db = -8

func _on_salir_pressed():
	get_tree().quit()

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://scenes/stage_0.tscn")
