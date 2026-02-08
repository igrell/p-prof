extends Game

func _ready():
	var trainer = get_parent()
	yield(info_box.set_text_for_confirm("Ilość komplementów i schlebień wywołała przemianę substancji, awansując członków komisji na stopień wyższy od profesora zwyczajnego."), "done")
	
	#trainer.monitoring = false
	player.pause_controls = false
	info_box.clear_text()
	info_box.visible = false

	done_()
