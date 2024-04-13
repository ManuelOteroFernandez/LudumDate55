extends Node

@export var sceneToSpawnList:Array[PackedScene]
@export var limitX:Vector2 = Vector2(20,1000)

func _on_timer_timeout():
	if (not sceneToSpawnList.is_empty()):
		var sceneToSpawn = sceneToSpawnList.pick_random()
		var nodeToSpawn = sceneToSpawn.instantiate()
		nodeToSpawn.position = Vector2(randf_range(limitX.x,limitX.y), -30)
		add_child(nodeToSpawn)
