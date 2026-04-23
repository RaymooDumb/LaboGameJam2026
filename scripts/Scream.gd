extends Node2D

func _ready():
	MusicManager.stop_music()
	$AudioStreamPlayer.play()
	
	# esperar 3 segundos y regresar al menú
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
