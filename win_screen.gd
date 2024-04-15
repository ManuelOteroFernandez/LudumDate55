extends CanvasLayer



func _on_back_to_menu():
	Global.runesCollected = 0
	get_tree().change_scene_to_file("res://Menus/SceneManager.tscn")
