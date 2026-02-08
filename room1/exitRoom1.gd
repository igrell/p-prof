extends Game

func _on_trigger_body_entered(body):
	if body is Player:
		player.pause_controls = true
		info_box.visible = true
		yield(info_box.set_text_for_confirm("Zenonie, to twoja chwila."), "done");
		yield(tween.wait(1), "done")
		player.pause_controls = false
		info_box.visible = false
		FadeTransition.fade_to_scene("res://room2/room2.tscn")
	
