extends CanvasLayer



func _on_back_to_menu():
	Global.runesCollected = 0
	get_tree().change_scene_to_file("res://Menus/SceneManager.tscn")

func _ready():
	var nRunes = Global.get_runes_collected()
	if nRunes == 1:
		$AnimatedSprite2D.play("inv1Idle")
	elif nRunes == 2:
		$AnimatedSprite2D.play("inv2Idle")
	elif nRunes == 3:
		$AnimatedSprite2D.play("inv3Idle")
	elif nRunes == 4:
		$AnimatedSprite2D.play("inv4Idle")
	elif nRunes == 5:
		$AnimatedSprite2D.play("inv5Idle")
	elif nRunes == 6:
		$AnimatedSprite2D.play("inv6Idle")
