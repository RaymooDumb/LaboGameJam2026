extends Area2D

var vida = 3
var velocidad = 500
var objetivo = Vector2.ZERO

signal jugador_muerto
var scaleRef : float = 1.0

func _ready():
	objetivo = get_viewport_rect().size / 2
	$Timer.start()
	$Timer.timeout.connect(_on_timer_timeout)

func me_han_dado(cantidad):
	if vida > 0:
		vida += cantidad
		print("Me has dado, vida:", vida)

func _process(_delta):
	if vida <= 0:
		print("enemigo muerto")
		queue_free()

func _on_timer_timeout():
	if vida > 0:
		print("El enemigo te ha matado")
		emit_signal("jugador_muerto")

func _on_closer_timer_timeout():
	scaleRef = scaleRef * 1.2
	scale = Vector2(scaleRef, scaleRef)
	$CloserTimer.start()
