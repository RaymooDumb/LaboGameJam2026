extends CharacterBody2D
var speed = 300

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("Right"):
		direction.x += 1
	elif Input.is_action_pressed("Left"):
		direction.x -= 1
	elif Input.is_action_pressed("Down"):
		direction.y += 1
	elif Input.is_action_pressed("Up"):
		direction.y -= 1

	velocity = direction.normalized() * speed
	move_and_slide()
