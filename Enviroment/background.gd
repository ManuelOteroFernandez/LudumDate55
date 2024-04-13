extends Sprite2D

@export var velocity = 100

func _process(delta):
	var newOffsetY = offset.y + velocity * delta
	if newOffsetY > 0:
		newOffsetY = -1296
	set_offset(Vector2(offset.x,newOffsetY))

