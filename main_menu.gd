extends Control

func _ready():
	MusicManager.play_music("menu")

func _on_salir_pressed():
	get_tree().quit()
