extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("on_collect_rune",_on_collect_rune)
	
func _on_collect_rune():
	text = "{0}/{1}".format([str(Global.get_runes_collected()),str(Global.runesToWin)])
	$AudioStreamPlayer.play()



