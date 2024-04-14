extends CharacterBody2D

const SPEED = 10000.0
var canHit = true

func _physics_process(delta):
	velocity.y = SPEED * delta
	move_and_slide()
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		velocity.x = collision.get_normal().x * SPEED * 2 * delta
		var collider = collision.get_collider()
		if canHit and collider.has_method("receive_damage"):
			collider.receive_damage(collision.get_normal() * SPEED * 2 * delta * -1)
			canHit = false
		else:
			move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
