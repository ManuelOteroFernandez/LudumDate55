extends CharacterBody2D

const SPEED = 10000.0

func _physics_process(delta):
	velocity.y = SPEED * delta
	move_and_slide()
