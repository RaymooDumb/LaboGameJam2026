extends CharacterBody2D
var speed = 300

@export var rightLook : bool = true

func _physics_process(_delta):
	var direction = Vector2.ZERO
	
	if velocity != Vector2(0,0):
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("standing")
	
	if rightLook == true:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
		
	if Input.is_action_pressed("Right"):
		rightLook = true
		direction.x += 1
	elif Input.is_action_pressed("Left"):
		rightLook = false
		direction.x -= 1
	#elif Input.is_action_pressed("Down"):
		#direction.y += 1
	#elif Input.is_action_pressed("Up"):
		#direction.y -= 1

	velocity = direction * speed
	move_and_slide()
