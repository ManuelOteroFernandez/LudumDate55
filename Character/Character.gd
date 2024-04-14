class_name Character extends CharacterBody2D

signal on_receive_damage(newValue:int)
signal on_arrow_move(direction:int)
signal on_trapped
signal on_liberate

@export var limits = Vector4(0,0,1100,600)
@export var lifes = 4

const SPEED = 12000.0

var unmove = false

func liberate():
	unmove = false
	on_liberate.emit()
	$Trapper.visible = false
	
func receive_health():
	lifes = 4
	on_receive_damage.emit(lifes)

func receive_damage(repulsionVelocity:Vector2):
	
	$CollisionShape2D/AnimatedSprite2D.play("hurt")
	velocity = repulsionVelocity
	$HitTimer.start()
	lifes -= 1
	on_receive_damage.emit(lifes)
	if lifes <= 0:
		get_tree().change_scene_to_file("res://lose_screen.tscn")
	
func _process(_delta):
	if unmove:
		if Input.is_action_just_pressed("ui_up"):
			on_arrow_move.emit(Global.DIRECTIONS.UP)
		if Input.is_action_just_pressed("ui_down"):
			on_arrow_move.emit(Global.DIRECTIONS.DOWN)
		if Input.is_action_just_pressed("ui_left"):
			on_arrow_move.emit(Global.DIRECTIONS.LEFT)
		if Input.is_action_just_pressed("ui_right"):
			on_arrow_move.emit(Global.DIRECTIONS.RIGHT)

func _physics_process(delta):
	if not unmove and $HitTimer.is_stopped():
		var directionX = Input.get_axis("ui_left", "ui_right")
		if directionX < 0: 
			$CollisionShape2D/AnimatedSprite2D.flip_h = true
			velocity.x = directionX * SPEED * delta
		elif directionX > 0:
			$CollisionShape2D/AnimatedSprite2D.flip_h = false
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
	$HitTimer.stop()
	$CollisionShape2D/AnimatedSprite2D.play("swim")
	
func trapped(trapper:Texture2D):
	$Trapper.texture = trapper
	$Trapper.visible = true
	unmove = true
	on_trapped.emit()
