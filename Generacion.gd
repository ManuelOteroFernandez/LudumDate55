extends Node

@export var sceneToSpawnList:Array[PackedScene]
@export var limitX:Vector2 = Vector2(20,1000)


func _ready():
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		var player = nodes[0]
		if player.has_signal("on_trapped"):
			player.connect("on_trapped", _on_player_trapped)
		if player.has_signal("on_liberate"):
			player.connect("on_liberate", _on_player_liberate)

func _on_player_trapped():
	if has_node("Timer"):
		$Timer.call_deferred("stop")

func _on_player_liberate():
	if has_node("Timer"):
		$Timer.call_deferred("start")

func _on_timer_timeout():
	if (not sceneToSpawnList.is_empty()):
		var sceneToSpawn = sceneToSpawnList.pick_random()
		var nodeToSpawn = sceneToSpawn.instantiate()
		if nodeToSpawn.has_method("set_limit_x"):
			nodeToSpawn.set_limit_x(limitX)
		else:
			nodeToSpawn.position = Vector2(randf_range(limitX.x,limitX.y), -30)
		add_child(nodeToSpawn)
