extends Game

func _on_trigger_body_entered(body):
	if body is Player:
		player.pause_controls = true
		info_box.visible = true
		player.pause_controls = false
		info_box.visible = false
		FadeTransition.fade_to_scene("res://room1/room1.tscn")
	
