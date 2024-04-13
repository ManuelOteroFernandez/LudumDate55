class_name Character extends CharacterBody2D

signal change_life(newValue:int)

@export var limits = Vector4(0,0,1100,600)
@export var lifes = 5
const SPEED = 12000.0

func get_damage():
	lifes -= 1
	change_life.emit(lifes)
	
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
