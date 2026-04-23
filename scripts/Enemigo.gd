extends Area2D

var vida = 3

signal jugador_muerto

func _ready():
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
