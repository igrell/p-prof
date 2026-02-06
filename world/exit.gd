extends Game

func _on_trigger_body_entered(body):
	player.pause_controls = true
	info_box.visible = true
	yield(info_box.set_text_for_confirm("Zenon Ela wszedl na schody."), "done");
	yield(info_box.set_text_for_confirm("Annoyed nobody pet you."), "done");
	yield(tween.wait(1), "done")
	get_tree().change_scene("res://stairs1.tscn")
	
