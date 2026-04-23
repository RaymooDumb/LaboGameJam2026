extends Area2D

@export var interactableType : String = "default"

var interactionary := {
	"stage_0":preload("res://scenes/stage_1.tscn"),
	"stage_1":preload("res://scenes/stage_2.tscn"),
	"stage_2":preload("res://scenes/stage_3.tscn"),
	"stage_3":preload("res://scenes/stage_4.tscn"),
	"stage_4":preload("res://scenes/stage_5.tscn"),
	"stage_5":preload("res://scenes/stage_6.tscn"),
	"stage_6":preload("res://scenes/stage_7.tscn"),
	"stage_7":preload("res://scenes/stage_8.tscn"),
	"stage_8":preload("res://scenes/stage_9.tscn"),
	"stage_9":"stageBattle"
}

func _on_body_entered(body):
	if body is CharacterBody2D:
		print("player entro al area")

func _on_body_exited(body):
	if body is CharacterBody2D:
		print("player dejo el area")
