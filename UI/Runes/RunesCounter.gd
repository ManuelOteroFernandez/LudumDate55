extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("on_collect_rune",_on_collect_rune)
	
func _on_collect_rune():
	var nRunes = Global.get_runes_collected()
	if nRunes == 1:
		$AnimatedSprite2D.play("inv1")
	elif nRunes == 2:
		$AnimatedSprite2D.play("inv2")
	elif nRunes == 3:
		$AnimatedSprite2D.play("inv3")
	elif nRunes == 4:
		$AnimatedSprite2D.play("inv4")
	elif nRunes == 5:
		$AnimatedSprite2D.play("inv5")
	elif nRunes == 6:
		$AnimatedSprite2D.play("inv6")
		


func _on_animated_sprite_2d_animation_finished():
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
	if $AnimatedSprite2D.animation == "inv6Idle":
		get_tree().current_scene.go_to_win_screen()
