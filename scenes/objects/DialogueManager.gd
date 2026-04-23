extends CanvasLayer

@onready var speaker: TextureRect = $Speaker1
@onready var bubbleBg: TextureRect = $MarginContainer/Box
@onready var textLabel: RichTextLabel = $RichTextLabel
@onready var container: Control = $MarginContainer
@onready var audio : AudioStreamPlayer = $AudioStreamPlayer

@export var charSpeed : float = 0.1

var genericSFX = preload("res://songs/sfx/Texto.ogg")

var portraitLoner = preload("res://sprites/talk/TalkLonerBG.png")
var portraitMonster = preload("res://sprites/talk/TalkMonsterBG.png")
var portraitGlasses = preload("res://sprites/talk/TalkGlassesBG.png")

var pitchRand : float = 1.0
var isTyping : bool = false
var fullText : String = ""
var charIndex : int = 0

var dialogueLines : Array = []
var linesIndex : int = 0

signal dialogue_finished

var lowRand : float = 0.9
var highRand : float = 1.0

var exampleDialogue : Array = [
	{
		#"name":"Dadku",
		"text":"Hola, este es un dialogo de prueba",
		"portrait":portraitLoner
	},
	{
		#"name":"Buzz",
		"text":"Hey! Sus! Animals!",
		"portrait":portraitMonster
	},
	{
		#"name":"Tigre",
		"text":"Yo soy un tigre eh",
		"portrait":portraitGlasses
	}]

func hideDialogue():
	speaker.visible = false
	container.visible = false

func close():
	hideDialogue()
	textLabel.clear()
	fullText = ""
	charIndex = 0
	emit_signal("dialogue_finished")
	
	get_tree().paused = false

func loadSFX(nam : String):
	match nam:
		#"Tigre", "tigre", "???":
			#audio.stream = tigreSFX
			#audio.volume_db = 8.0
			#lowRand = 0.8
			#highRand = 0.9
		_:
			audio.stream = genericSFX
			audio.volume_db = 0.0
			lowRand = 0.8
			highRand = 0.9

func startDialogue(array : Array): #Empieza secuencia de dialogo
	if array.is_empty():
		return
	
	get_tree().paused = true
	
	dialogueLines = array
	linesIndex = 0
	container.visible = true
	showLine()

func showLine():
	var line = dialogueLines[linesIndex]
	
	fullText = line.get("text", "")
	charIndex = 0
	isTyping = true
	
	textLabel.clear()
	
	var portrait : Texture2D = line.get("portrait", null)
	
	if portrait:
		speaker.texture = portrait
		speaker.visible = true
	else:
		speaker.visible = false
	
	loadSFX(line.get("name", ""))
	typewriter()

func typewriter(): # Funcion para mostrar el texto poquito a poco undertale jiji
	while charIndex < fullText.length():
		textLabel.append_text(fullText[charIndex])
		charIndex += 1
		if !isTyping:
			break
		
		randomize()
		pitchRand = randf_range(lowRand, highRand)
		audio.pitch_scale = pitchRand
		audio.play()
		
		await get_tree().create_timer(charSpeed).timeout
	
	textLabel.clear()
	textLabel.text = fullText
	
	isTyping = false

func advanceDialogue():
	linesIndex += 1
	
	if linesIndex >= dialogueLines.size():
		close()
	else:
		showLine()

# Esta bien revuelto todo esto D:
func _ready():
	hideDialogue()
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	set_process_unhandled_input(true)
	#startDialogue(exampleDialogue) # Dialogo para testing

func _unhandled_input(event: InputEvent) -> void:
	if not container.visible:
		return

	if event.is_action_pressed("Click") or event.is_action_pressed("Interact"):
		get_viewport().set_input_as_handled() # esto es una trampa para que no haya pedidous con otro input de ataque
		if isTyping:
			isTyping = false
		else: # si ifTyping es false significa que acabo de hacer eso 
			advanceDialogue()
