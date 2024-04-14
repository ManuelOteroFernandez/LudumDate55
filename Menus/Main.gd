extends Control

var emisor

func _ready():
	emisor = $Pivote

func _process(_delta):
	emisor.rotation += 0.002

func _on_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
