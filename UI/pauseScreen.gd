extends CanvasLayer

@onready var audioS = $botonSonHover



func _on_mouse_entered():
	audioS.play()


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_restart_pressed():
	pass
	#TODO Hay que modificar scenemanager
	#get_tree().reload_current_scene()


func _on_btn_resume_pressed():
	Global.pause()
	
