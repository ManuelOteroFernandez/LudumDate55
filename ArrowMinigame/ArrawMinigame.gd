extends Control

@export var numToGenerate = 5
var numGenerated = 0
var numWins = 0
var player
var _is_active = false

func is_active():
	return _is_active

func activate():
	$Timer.start()
	player.unmove = true
	$ValidationZone.new_position()
	$ValidationZone.visible = true
	$ColorRect2.visible = true
	_is_active = true
	
func deactivate():
	player.liberate()
	numWins = 0
	numGenerated = 0
	$ColorRect2.visible = false
	$ValidationZone.visible = false
	_is_active = false
	
func _ready():
	$ValidationZone.new_position()
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		player = nodes[0]
		if player.has_signal("on_arrow_move"):
			player.connect("on_arrow_move",_on_player_arrow_just_pressed)
		if player.has_signal("on_trapped"):
			player.connect("on_trapped", _on_player_trapped)

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
			deactivate()
	else:
		$Timer.stop()
		for node in nodes:
			node.queue_free()
			
		player.receive_damage(Vector2(0,0))
		deactivate()

func _on_player_trapped():
	activate()
