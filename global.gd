extends Node

enum DIRECTIONS{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

const _runesToWin = 6

var _runesCollected = 0
func collect_rune():
	_runesCollected += 1
	if _runesCollected <= _runesToWin:
		get_tree().change_scene_to_file("win_screen.tscn")
