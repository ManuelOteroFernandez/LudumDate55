extends Sprite2D

@export var velocity = 100
@export var initialOffser = -1296

func _process(delta):
	var newOffsetY = offset.y + velocity * delta
	if newOffsetY > -576:
		newOffsetY = initialOffser
	set_offset(Vector2(offset.x,newOffsetY))

