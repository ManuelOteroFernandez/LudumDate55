extends Control

var emisor

func _ready():
	emisor = $Pivote

func _process(delta):
	emisor.rotation += 0.004

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
