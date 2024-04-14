extends CharacterBody2D

@export var position_spawn_y = -500
@export var speed = 10000.0
var canHit = true


func set_position_x_spawn(limitX):
	position = Vector2(randf_range(limitX.x,limitX.y), position_spawn_y)

func _ready():
	$AnimatedSprite2D.frame = randi_range(
		0,
		$AnimatedSprite2D.sprite_frames.get_frame_count(
			$AnimatedSprite2D.animation
		)
	)

func _physics_process(delta):
	velocity.y = speed * delta
	move_and_slide()
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		velocity.x = collision.get_normal().x * speed * 2 * delta
		var collider = collision.get_collider()
		if canHit and collider.has_method("receive_damage"):
			collider.receive_damage(collision.get_normal() * speed * 2 * delta * -1)
			
			if collision.get_collider().is_in_group("player"):
				canHit = false
		else:
			move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
