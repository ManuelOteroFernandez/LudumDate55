extends Control

@export var numToGenerate = 5
var numGenerated = 0
var numWins = 0
var player

func activate():
	$Timer.start()
	player.unmove = true

func _ready():
	$ValidationZone.new_position()
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		player = nodes[0]
		if player.has_signal("on_arrow_move"):
			player.connect("on_arrow_move",_on_player_arrow_just_pressed)

func on_spawn():
	numGenerated+=1
	if numToGenerate <= numGenerated:
		$Timer.stop()

func _on_player_arrow_just_pressed(value:int):
	var validZone:Vector2 = $ValidationZone.get_valid_postion()
	var nodes = get_tree().get_nodes_in_group("arrow")
	var win = false
	for node in nodes:
		if node.has_method("get_pos_y") and validZone.x < node.get_pos_y() and \
		node.get_pos_y() < validZone.y and node.has_method("get_type") and node.get_type() == value:
			win = true
			node.queue_free()
		
	if win:
		numWins += 1
		if(numWins >= numToGenerate):
			player.receive_health()
			player.unmove = false
			numWins = 0
			numGenerated = 0
	else:
		$Timer.stop()
		numWins = 0
		numGenerated = 0
		player.receive_damage(Vector2(0,0))
		for node in nodes:
			node.queue_free()
		$Timer.start()
