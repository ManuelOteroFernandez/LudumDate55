extends Node

signal on_collect_rune

enum DIRECTIONS{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

const runesToWin = 6

const pauseScreenScene = preload("res://UI/pauseScreen.tscn")
var _pauseScreenInstance:Node
var runesCollected = 0
func collect_rune():
	runesCollected += 1
	on_collect_rune.emit()

func get_runes_collected():
	return runesCollected

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	if Input.is_action_just_pressed("ui_pause"):
		pause()

func pause():
	var currentScene = get_tree().current_scene.get_child(0).get_child(0)
	if  currentScene.is_in_group("GAME"):
		var isPaused = get_tree().paused
		get_tree().paused = not isPaused
		if not isPaused:
			_pauseScreenInstance = pauseScreenScene.instantiate()
			currentScene.add_child(_pauseScreenInstance)
		elif _pauseScreenInstance:
			_pauseScreenInstance.queue_free()
