extends Node

signal on_collect_rune

enum DIRECTIONS{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

const runesToWin = 6

var _runesCollected = 0
func collect_rune():
	_runesCollected += 1
	on_collect_rune.emit()
	if _runesCollected >= runesToWin:
		get_tree().change_scene_to_file("win_screen.tscn")

func get_runes_collected():
	return _runesCollected
