extends Area2D
var vida = 3

func me_han_dado(cantidad):
	if vida > 0:
		vida += cantidad
		print("Me has dado")

func _process(_delta):
	if vida == 0:
		queue_free() 
