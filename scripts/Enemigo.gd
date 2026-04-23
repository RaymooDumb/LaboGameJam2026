extends Area2D

var vida = 3
var velocidad = 500
var objetivo = Vector2.ZERO

signal jugador_muerto


func _ready():
	objetivo = get_viewport_rect().size / 2
	$Timer.start()
	$Timer.timeout.connect(_on_timer_timeout)

func me_han_dado(cantidad):
	if vida > 0:
		vida += cantidad
		print("Me has dado, vida:", vida)

func _process(delta):
	var direccion = (objetivo - global_position).normalized()
	global_position += direccion * velocidad * delta
	
	if global_position.distance_to(objetivo) < 20:
		print("TE ALCANZÓ")
		emit_signal("jugador_muerto")
	if vida <= 0:
		print("enemigo muerto")
		queue_free()

func _on_timer_timeout():
	if vida > 0:
		print("El enemigo te ha matado")
		emit_signal("jugador_muerto")
