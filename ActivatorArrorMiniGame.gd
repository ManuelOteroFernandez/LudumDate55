extends Timer


func _on_timeout():
	if not $ArrowMiniGame.is_active():
		$ArrowMiniGame.activate()
