extends TextureRect

signal on_screen_exited

const SPEED = 250.0

var typeList = {
	Global.DIRECTIONS.UP:load('res://ArrowMinigame/steamdeck_dpad_up.png'),
	Global.DIRECTIONS.DOWN:load('res://ArrowMinigame/steamdeck_dpad_down.png'),
	Global.DIRECTIONS.LEFT:load('res://ArrowMinigame/steamdeck_dpad_left.png'),
	Global.DIRECTIONS.RIGHT:load('res://ArrowMinigame/steamdeck_dpad_right.png'),
}
var type:int = Global.DIRECTIONS.UP 

func set_position_x_spawn(limitX):
	position = Vector2(randf_range(limitX.x,limitX.y), -30)
	
func get_type():
	return type
	
func get_pos_y():
	return position.y + 30

func _ready():
	type = randi_range(0,len(typeList)-1)
	texture = typeList[type]

func _process(delta):
	position.y += delta * SPEED

func _on_visible_on_screen_notifier_2d_screen_exited():
	on_screen_exited.emit()
	queue_free()
