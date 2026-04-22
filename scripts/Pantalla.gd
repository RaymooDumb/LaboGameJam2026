extends Node

var municion_maxima = 6
var municion_actual = municion_maxima
var area_en_la_mira = null
signal cambiar_vida(cantidad)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var _ce = cambiar_vida.connect($Enemigo.me_han_dado)

func get_input(_delta):
	if Input.is_action_just_pressed("Click"):
		if municion_actual > 0:
			print("disparas")
			#print($Cursor.position)
			municion_actual -= 1
			disparar()
		else:
			print("debes recargar")
		cambiar_municion_representada()
	if Input.is_action_just_pressed("Reload"):
		if municion_actual < municion_maxima:
			municion_actual= municion_maxima
			print("has recargado")
		cambiar_municion_representada()
		
func _physics_process(delta):
	get_input(delta)

func cambiar_municion_representada():
	var _frame = municion_maxima-municion_actual
	#$CanvasLayer/Panel/Sprite.frame = _frame

func disparar():
	if area_en_la_mira != null:
		print("Has impactaddo a %s"% area_en_la_mira.name)
		emit_signal("cambiar_vida", -1)

func _on_cursor_area_entered(area):
	#print("area entered")
	area_en_la_mira = area

func _on_cursor_area_exited(_area):
	#print("area exited")
	area_en_la_mira = null
