extends Area2D
var vida = 3
func _ready():
	$Timer.start()
	$Timer.timeout.connect(_on_timer_timeout)

func me_han_dado(cantidad):
	if vida > 0:
		vida += cantidad
		print("Me has dado")

func _process(_delta):
	if vida == 0:
		queue_free() 
func _on_timer_timeout():
	print("Timer terminado")
	if vida > 0:
		print("El enemigo te ha matado")
		get_tree().change_scene_to_file("res://mainMenu.tscn")
