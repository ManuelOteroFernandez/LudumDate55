extends Node

const SceneTwo = preload("res://game.tscn")

func _process(delta):
	pass
	


func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(SceneTwo.instantiate())


func _on_main_exit_menu():
	$TransitionScreen.transition()
