extends Area2D

@export var interactableType : String = "default"

var interactionary := {
	"stage_0": "res://scenes/stage_1.tscn",
	"stage_1": "res://scenes/stage_2.tscn",
	"stage_2": "res://scenes/stage_3.tscn",
	"stage_3": "res://scenes/stage_4.tscn",
	"stage_4": "res://scenes/stage_5.tscn",
	"stage_5": "res://scenes/stage_6.tscn",
	"stage_6": "res://scenes/stage_7.tscn",
	"stage_7": "res://scenes/stage_8.tscn",
	"stage_8": "res://scenes/stage_9.tscn",
	"stage_9": "res://scenes/stage_cutscene.tscn"
}

func _on_body_entered(body):
	if body is CharacterBody2D:
		if interactableType in interactionary:
			#var ola = interactionary[interactableType]
			get_tree().call_deferred("change_scene_to_file", interactionary[interactableType])

#func _on_body_exited(body):
#	if body is CharacterBody2D:
#		print("player dejo el area")
