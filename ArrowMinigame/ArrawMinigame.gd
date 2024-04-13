extends Control

@export var numToGenerate = 5
var numGenerated = 0
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	$ValidationZone.new_position()
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		player = nodes[0]
		if player.has_signal("on_arrow_move"):
			player.connect("on_arrow_move",_on_player_arrow_just_pressed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_spawn():
	numGenerated+=1
	if numToGenerate <= numGenerated:
		$Timer.stop()

func _on_player_arrow_just_pressed(value:int):
	var validZone:Vector2 = $ValidationZone.get_valid_postion()
	var nodes = get_tree().get_nodes_in_group("arrow")
	var win = false
	for node in nodes:
		if validZone.x > node.position.y and node.position.y > validZone.y and \
			node.has_method("get_type") and node.get_type() == value:
			win = true
		
	if win:
		print("win")
	else:
		print("loose")
