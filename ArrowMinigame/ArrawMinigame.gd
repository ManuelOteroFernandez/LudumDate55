extends Control

@export var numToGenerate = 5
@onready var soundWin = load("res://Sounds/powerUp7.ogg")
@onready var soundLose = load("res://Sounds/Retro Event Wrong Simple 03.wav")

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
	_is_active = false
	numWins = 0
	numGenerated = 0
	$ColorRect2.visible = false
	$ValidationZone.visible = false
	
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
	if numToGenerate <= numGenerated:
		$Timer.stop()
	else:
		var node = $Timer.spawn()
		if node and node.is_in_group("arrow"):
			node.connect("on_screen_exited",on_arrow_screen_exited)
	numGenerated+=1

func on_arrow_screen_exited():
	if _is_active:
		deactivate()
		$Timer.stop()
		var nodes = get_tree().get_nodes_in_group("arrow")
		for node in nodes:
			node.visible = false
			
		$AudioStreamPlayer.stream = soundLose
		$AudioStreamPlayer.play()
		player.receive_damage(Vector2(0,0))

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
			$AudioStreamPlayer.stream = soundWin
			$AudioStreamPlayer.play()
			player.receive_health()
			deactivate()
	else:
		$AudioStreamPlayer.stream = soundLose
		$AudioStreamPlayer.play()

func _on_player_trapped():
	activate()
