extends Node2D

var stage7: Array = [
	{
		"text":"Q-Que es eso?",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Creo que... Puedo escuchar algo arriba...",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Aqui es donde... Ella deberia estar...",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Tengo que apresurarme! E-Espero que nada malo este pasando arriba...",
		"portrait":DialogueBox.portraitLoner
	}
]

func _ready():
	MusicManager.play_music("revelation")
	DialogueBox.startDialogue(stage7)
