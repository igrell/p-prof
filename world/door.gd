extends Area2D

class_name Door

export var destination_level_tag: String
export var destination_door_tag: String
export var spawn_direction = "up"

onready var spawn = $spawn

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_door_body_entered(body):
	if body is Player:
		pass
