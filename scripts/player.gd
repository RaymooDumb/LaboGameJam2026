extends CharacterBody2D

@export var speedset = 500
var speed

func _ready():
	pass

func get_input():
	var input_direction = Input.get_vector("Left","Right","Up","Down")
	if Input.is_anything_pressed():
		velocity = input_direction * speed
	else:
		velocity = Vector2(0,0)

func _physics_process(_delta):
	speed = speedset
	
	# Esto es para cuando se necesite ver si colisiona con algo
	#var collision = move_and_collide(velocity * delta)
	
	get_input()
	
	move_and_slide()
