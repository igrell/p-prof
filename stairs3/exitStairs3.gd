extends Game

func _on_trigger_body_entered(body):
	if body is Player:
		player.pause_controls = true
		info_box.visible = true
		yield(info_box.set_text_for_confirm("Zenon Ela wchodzi do pokoju."), "done");
		yield(tween.wait(1), "done")
		player.pause_controls = false
		info_box.visible = false
		get_tree().change_scene("res://room1/room1.tscn")
	
