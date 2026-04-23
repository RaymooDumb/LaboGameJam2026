extends Control

var cutscene : Array = [
	{
		"text":"Al entrar, no puede verse nada.",
		"portrait":null
	},
	{
		"text":"Tan solo se escuchan guturales sonidos de un monstruo devorando a su presa seguido de un silencio estremecedor.",
		"portrait":null
	},
	{
		"text":"...",
		"portrait":null
	},
	{
		"text":"Eres tu. Cierto?",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"E--E-Eh... Y-Yo... Y-Y-Yo...",
		"portrait":DialogueBox.portraitLoner
	},
	{
		"text":"Tuve que haber sabido que serias demasiado estupida como para seguir instrucciones... Siempre ha sido asi no?",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"La cara de la chica se retuerce de formas inhumanas. Sombrias risillas se escuchan bajo su pesado aliento.",
		"portrait":null
	},
	{
		"text":"Ni siquiera sabes que decir... Es patetico.",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"Pero no te preocupes.",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"No tendras que decir nada nunca mas.",
		"portrait":DialogueBox.portraitMonster
	},
	{
		"text":"CUIDADO! Utiliza click izquierdo para disparar y derecho para recargar. Tienes 6 balas.",
		"portrait":DialogueBox.portraitMonster
	}]

func _ready():
	MusicManager.stop_music()

func _on_timer_timeout():
	DialogueBox.startDialogue(cutscene)
	$Timer2.start()

func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://scenes/Escena_p.tscn")
