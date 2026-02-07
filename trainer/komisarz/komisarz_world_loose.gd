extends Game

func _ready():
	var trainer = get_parent()
	yield(info_box.set_text_for_confirm("Kurdebele"), "done")
	yield(info_box.set_text_for_confirm("No niech pan wejdzie!"), "done")
	yield(info_box.set_text_for_confirm("Ale wydzial zamyka sie o 21!"), "done")
	
	#trainer.monitoring = false
	player.pause_controls = false
	info_box.clear_text()
	info_box.visible = false

	done_()
