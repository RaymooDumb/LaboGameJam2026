extends Node2D

var municion_maxima = 6
var municion_actual = 6
var area_en_la_mira = null 
var tiempo_ultimo_spawn = 0.0
var ultimo_spawn = -1

var enemigo_escena = preload("res://scenes/objects/enemigo.tscn")

@onready var puntos_spawn = [
	$Spawn1,
	$Spawn2,
	$Spawn3
]

var enemigo_actual = null

func _ready():
	randomize()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	spawn_enemigo()

func _physics_process(delta):
	get_input(delta)

func get_input(_delta):
	if Input.is_action_just_pressed("Click"):
		if municion_actual > 0:
			municion_actual -= 1
			disparar()
		else:
			print("debes recargar")
		cambiar_municion_representada()

	if Input.is_action_just_pressed("Reload"):
		if municion_actual < municion_maxima:
			municion_actual = municion_maxima
			print("has recargado")
		cambiar_municion_representada()

func disparar():
	$AudioDisparo.play()
	if area_en_la_mira != null:
		if area_en_la_mira.has_method("me_han_dado"):
			area_en_la_mira.me_han_dado(-1)
			print("Impacto confirmado")

func cambiar_municion_representada():
	var _frame = municion_maxima - municion_actual

func _on_cursor_area_entered(area):
	area_en_la_mira = area

func _on_cursor_area_exited(_area):
	area_en_la_mira = null

func spawn_enemigo():
	var ahora = Time.get_ticks_msec() / 1000.0
	
	if tiempo_ultimo_spawn != 0:
		var diferencia = ahora - tiempo_ultimo_spawn
		print("Tiempo desde el ultimo spawn:", diferencia, "segundos")
	
	tiempo_ultimo_spawn = ahora
	
	var index
	while true:
		index = randi() % puntos_spawn.size()
		if index != ultimo_spawn:
			break
	
	ultimo_spawn = index
	var punto = puntos_spawn[index]

	print("Spawn en:", punto.global_position)
	enemigo_actual = enemigo_escena.instantiate()
	add_child(enemigo_actual)
	enemigo_actual.global_position = punto.global_position

	print("Enemigo spawneado en:", punto.name)

	enemigo_actual.tree_exited.connect(_on_enemigo_muerto)
	enemigo_actual.jugador_muerto.connect(_on_jugador_muerto)

func _on_enemigo_muerto():
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = true
	add_child(timer)

	timer.timeout.connect(func():
		spawn_enemigo()
		timer.queue_free()
	)

	timer.start()

func _on_jugador_muerto():
	print("PERDISTE")
	get_tree().change_scene_to_file("res://mainMenu.tscn")
