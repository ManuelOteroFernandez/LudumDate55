extends TextureRect

const SPEED = 100.0

var typeList = {
	GLOBAL.DIRECTIONS.UP:load('res://ArrowMinigame/steamdeck_dpad_up.png'),
	GLOBAL.DIRECTIONS.DOWN:load('res://ArrowMinigame/steamdeck_dpad_down.png'),
	GLOBAL.DIRECTIONS.LEFT:load('res://ArrowMinigame/steamdeck_dpad_left.png'),
	GLOBAL.DIRECTIONS.RIGHT:load('res://ArrowMinigame/steamdeck_dpad_right.png'),
}
var type:int = GLOBAL.DIRECTIONS.UP 

func get_type():
	return type
	
func get_pos_y():
	return position.y + 30

func _ready():
	type = randi_range(0,len(typeList)-1)
	texture = typeList[type]

func _process(delta):
	position.y += delta * SPEED
	if position.y > 1000:
		queue_free()
