extends CanvasLayer

@onready var audioS = $botonSonHover



func _on_mouse_entered():
	audioS.play()


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_restart_pressed():
	Global.pause()
	get_tree().current_scene.go_to_game()


func _on_btn_resume_pressed():
	Global.pause()
	
