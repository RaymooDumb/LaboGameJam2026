extends Node2D

var stage9 : Array = [
	{
		"text":"Ese sonido... Viene de aqui...",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"...",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Esta bien... Solo entra. Todo estara bien...!",
		"portrait":DialogueBox.portraitLoner
	}]

func _ready():
	DialogueBox.startDialogue(stage9)
