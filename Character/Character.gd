extends CharacterBody2D

@export var limits = Vector4(0,0,1100,600)

const SPEED = 10000.0

func _physics_process(delta):
	var directionX = Input.get_axis("ui_left", "ui_right")
	
	if limits.x < position.x and directionX < 0: 
		velocity.x = directionX * SPEED * delta
	elif position.x < limits.z and directionX > 0:
		velocity.x = directionX * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var directionY = Input.get_axis("ui_up", "ui_down")
	if limits.y < position.y and directionY < 0: 
		velocity.y = directionY * SPEED * delta
	elif position.y < limits.z and directionY > 0:
		velocity.y = directionY * SPEED * delta
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
