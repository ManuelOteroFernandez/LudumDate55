class_name Character extends CharacterBody2D

signal change_life(newValue:int)

@export var limits = Vector4(0,0,1100,600)
@export var lifes = 4

const SPEED = 12000.0

var unmove = false

func receive_damage(repulsionVelocity:Vector2):
	velocity = repulsionVelocity
	unmove = true
	$HitTimer.start()
	lifes -= 1
	change_life.emit(lifes)
	print(lifes)
	
func _physics_process(delta):
	if not unmove:
		var directionX = Input.get_axis("ui_left", "ui_right")
		if directionX < 0: 
			velocity.x = directionX * SPEED * delta
		elif directionX > 0:
			velocity.x = directionX * SPEED * delta
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		var directionY = Input.get_axis("ui_up", "ui_down")
		if directionY < 0: 
			velocity.y = directionY * SPEED * delta
		elif directionY > 0:
			velocity.y = directionY * SPEED * delta
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Block movement out of limits
	if limits.x > position.x and velocity.x < 0: 
		velocity.x = 0
	elif position.x > limits.z and velocity.x > 0:
		velocity.x = 0

	if limits.y > position.y and velocity.y < 0: 
		velocity.y = 0
	elif position.y > limits.w and velocity.y > 0:
		velocity.y = 0
		
	move_and_slide()


func _on_hit_timer_timeout():
	unmove = false
