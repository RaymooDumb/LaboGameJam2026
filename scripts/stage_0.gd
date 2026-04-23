extends Node2D

var stage0: Array = [
	{
		"text":"Te estoy diciendo, Lily, ese es el mejor tr-",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"Hmm? P-Pasa algo?",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Ah. Nada. Solo me empece a sentir... Rara. Jeje...",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"Ademas, recorde que hay algo que debo hacer. Se una buena chica y quedate cuidando por aqui, ok?",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"Hmm... Esta bien...",
		"portrait":DialogueBox.portraitLoner
	}
]

func _ready():
	DialogueBox.startDialogue(stage0)
	MusicManager.play_music("world")
	MusicManager.current_track.volume_db = 0
