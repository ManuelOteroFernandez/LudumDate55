extends Area2D

const SPEED_COLLECT = 20
const SPEED = 100

var playerIn = false

func set_position_x_spawn(limitX):
	position = Vector2(randf_range(limitX.x,limitX.y), -30)
	
func _ready():
	$CollisionShape2D/AnimatedSprite2D.frame = randi_range(0,34)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TextureProgressBar.value <= 0:
		position.y += SPEED * delta
	
	if playerIn:
		$TextureProgressBar.value += delta * SPEED_COLLECT
		if $TextureProgressBar.value >= 100:
			Global.collect_rune()
			queue_free()
	else:
		$TextureProgressBar.value -= delta * SPEED_COLLECT




func _on_body_entered(body):
	if body.is_in_group("player"):
		playerIn = true
		$AudioStreamPlayer.play()


func _on_body_exited(body):
	if body.is_in_group("player"):
		playerIn = false
		$AudioStreamPlayer.stop()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
