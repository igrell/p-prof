extends CanvasLayer                                                                                                                         
																																			
onready var animation_player: AnimationPlayer = $AnimationPlayer                                                                            
var target_scene_path: String = ""                                                                                                          
																																			
# This makes sure we don't try to change scenes while already transitioning.                                                                
var is_transitioning: bool = false                                                                                                          
																																			
func _ready() -> void:                                                                                                                      
	# Connect the signal for when an animation finishes.                                                                                    
	# This is how we'll know when to change the scene.                                                                                      
	animation_player.connect("animation_finished", self, "_on_animation_finished")                                                          
																																			
func fade_to_scene(scene_path: String) -> void:                                                                                             
	"""                                                                                                                                     
	Call this function from anywhere to fade to a new scene.                                                                                
	e.g. FadeTransition.fade_to_scene("res://MyNewScene.tscn")                                                                              
	"""                                                                                                                                     
	if is_transitioning:                                                                                                                    
		return                                                                                                                              
																																			
	is_transitioning = true                                                                                                                 
	target_scene_path = scene_path                                                                                                          
	animation_player.play("fade_out")                                                                                                       
																																			
func _on_animation_finished(anim_name: String) -> void:                                                                                     
	if anim_name == "fade_out":                                                                                                             
		# The screen is now black. Time to change the scene.                                                                                
		var error = get_tree().change_scene(target_scene_path)                                                                              

		if error != OK:                                                                                                                     
			# If the scene fails to load, we don't want to be stuck on a black screen.                                                      
			print("Error changing scene to: " + target_scene_path)                                                                          
			animation_player.play("fade_in")                                                                                                
			is_transitioning = false                                                                                                        
		else:                                                                                                                               
			# If the scene change was successful, fade in to reveal the new scene.                                                          
			animation_player.play("fade_in")                                                                                                
																																			
	elif anim_name == "fade_in":                                                                                                            
		# The transition is complete.                                                                                                       
		is_transitioning = false
