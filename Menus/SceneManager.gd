extends Node2D

const GAME = preload("res://game.tscn")
const LOST_SCREEN = preload("res://lost_screen.tscn")
const WIN_SCREEN = preload("res://win_screen.tscn")
var nextScene

func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(nextScene.instantiate())

func go_to_win_screen():
	nextScene = WIN_SCREEN
	$TransitionScreen.transition()


func go_to_lost_screen():
	nextScene = LOST_SCREEN
	$TransitionScreen.transition()

func _on_main_exit_menu():
	nextScene = GAME
	$TransitionScreen.transition()
