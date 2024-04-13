extends Control
func _ready():
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		var player = nodes[0]
		player.connect("on_receive_damage",_on_character_on_receive_damage)

func _on_character_on_receive_damage(newLife:int):
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
