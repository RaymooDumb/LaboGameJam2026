extends Area2D

@export var interactableType : String = "default"

func _on_body_entered(body):
	if body is CharacterBody2D:
		print("player entro al area")

func _on_body_exited(body):
	if body is CharacterBody2D:
		print("player dejo el area")
