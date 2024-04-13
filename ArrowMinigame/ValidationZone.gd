extends ColorRect

@export var limits:Vector2 = Vector2(200,581)

func new_position():
	position.y = randf_range(limits.x ,limits.y)

func get_valid_postion():
	return Vector2(position.y - 15, position.y+size.y + 15)
