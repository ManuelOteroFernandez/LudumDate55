extends Area2D

const SPEED = 500
var _limitX:Vector2 = Vector2(200,800)

var move = true

func _ready():
	Vector2(randf_range(_limitX.x,_limitX.y), -30)
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		position.x = nodes[0].position.x
		position.y = -30
	else:
		Vector2(randf_range(_limitX.x,_limitX.y), -30)


func _process(delta):
	if move:
		position.y += SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("trapped"):
		move =false
		var anim:AnimatedSprite2D = $CollisionShape2D/AnimatedSprite2D
		body.trapped(anim.sprite_frames.get_frame_texture(
			anim.animation,
			anim.frame
		))
		queue_free()
