extends Node2D

var stage1 : Array = [
	{
		"text":"Hmm... Supongo que ire a dar una vuelta",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Es algo extraño que ella salga asi como asi, suele ser muy... Estricta... Con nuestro trabajo",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Si esta en algun lugar por aqui creo que se donde puede ser...",
		"portrait":DialogueBox.portraitLoner
	}]

func _ready():
	DialogueBox.startDialogue(stage1)
