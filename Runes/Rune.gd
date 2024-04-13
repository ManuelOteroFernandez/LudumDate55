extends Area2D

const SPEED_COLLECT = 20
const SPEED = 100

var playerIn = false

func _ready():
	$CollisionShape2D/AnimatedSprite2D.frame = randi_range(0,35)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TextureProgressBar.value <= 0:
		position.y += SPEED * delta
	
	if playerIn:
		$TextureProgressBar.value += delta * SPEED_COLLECT
		if $TextureProgressBar.value >= 100:
			print("WIN rune")
			queue_free()
	else:
		$TextureProgressBar.value -= delta * SPEED_COLLECT




func _on_body_entered(body):
	if body.is_in_group("player"):
		playerIn = true


func _on_body_exited(body):
	if body.is_in_group("player"):
		playerIn = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
