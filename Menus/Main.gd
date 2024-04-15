extends Control

var emisor
@onready var audioS = $botonSonHover
@onready var audioI = $botonSonClick

var _menu_exited = false
signal exit_menu
func _ready():
	emisor = $Pivote

func _process(_delta):
	emisor.rotation += 0.002

func _on_button_pressed():
	if not _menu_exited:
		_menu_exited = true
		emit_signal("exit_menu")
		audioI.play()


func _on_button_mouse_entered():
	audioS.play()
