extends Node

var enemyScene = preload("res://Enemies/Enemy.tscn")


func _on_timer_timeout():
	var enemy = enemyScene.instantiate()
	enemy.position = Vector2(randf_range(20,1000), -20)
	add_child(enemy)
