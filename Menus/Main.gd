extends Control

var emisor
@onready var audioS = $botonSonHover
@onready var audioI = $botonSonClick

#@onready var simultaneous_scene = preload("res://Menus/TransitionScreen.tscn").instantiate()
signal exit_menu
func _ready():
	emisor = $Pivote
	#$TransitionScreen.hide()

func _process(_delta):
	emisor.rotation += 0.002

func _on_button_pressed():
	#get_tree().root.add_child(simultaneous_scene)
	emit_signal("exit_menu")
	#get_tree().change_scene_to_file("res://Menus/Transition.tscn")
	audioI.play(0.0)


func _on_button_mouse_entered():
	audioS.play(0.0)
