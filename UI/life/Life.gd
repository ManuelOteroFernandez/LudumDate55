extends Control


@export var character:Character

func _ready():
	character.connect("change_life",_on_character_change_life)

func _on_character_change_life(newLife:int):
	if newLife >= 4:
		$Life4.visible = true
	elif newLife == 3:
		$Life4.visible = false
		$Life3.visible = true
	elif newLife == 2:
		$Life4.visible = false
		$Life3.visible = false
		$Life2.visible = true
	elif newLife == 1:
		$Life4.visible = false
		$Life3.visible = false
		$Life2.visible = false
		$Life1.visible = true
