extends Node

@export var sceneToSpawnList:Array[PackedScene]
@export var lvl2SceneToSpawnList:Array[PackedScene]
@export var lvl3SceneToSpawnList:Array[PackedScene]
@export var limitX:Vector2 = Vector2(20,1000)
@export var stopSpawnWhenPlayerIsTrapped:bool = true

func _ready():
	Global.connect("on_collect_rune",_on_collect_rune)
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		var player = nodes[0]
		if player.has_signal("on_trapped"):
			player.connect("on_trapped", _on_player_trapped)
		if player.has_signal("on_liberate"):
			player.connect("on_liberate", _on_player_liberate)

func _on_collect_rune():	
	if not lvl2SceneToSpawnList.is_empty() and Global.get_runes_collected() == 1:
		sceneToSpawnList = lvl2SceneToSpawnList
	elif not lvl3SceneToSpawnList.is_empty() and Global.get_runes_collected() == 3:
		sceneToSpawnList = lvl3SceneToSpawnList
		Global.disconnect("on_collect_rune",_on_collect_rune)
		
func _on_player_trapped():
	if stopSpawnWhenPlayerIsTrapped and has_node("Timer"):
		$Timer.call_deferred("stop")

func _on_player_liberate():
	if stopSpawnWhenPlayerIsTrapped and has_node("Timer"):
		$Timer.call_deferred("start")

func _on_timer_timeout():
	spawn()
	
func spawn():
	if (not sceneToSpawnList.is_empty()):
		var sceneToSpawn = sceneToSpawnList.pick_random()
		var nodeToSpawn = sceneToSpawn.instantiate()
		if nodeToSpawn.has_method("set_position_x_spawn"):
			nodeToSpawn.set_position_x_spawn(limitX)
		else:
			nodeToSpawn.position = Vector2(randf_range(limitX.x,limitX.y), -500)
		add_child(nodeToSpawn)
		
		return nodeToSpawn
