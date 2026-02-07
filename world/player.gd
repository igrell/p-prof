tool
extends KinematicBody2D

export(Resource) var trainer

class_name Player

const speed := 100.0

const animation_ = {
	"idle": "idle",
	"west": "west",
	"east": "east",
	"south": "south",
	"north": "north"
}

onready var sprite = $sprite
var velocity := Vector2.ZERO
var pause_controls := false

func _physics_process(_delta:float):
	var direction := Vector2.ZERO

	if not pause_controls:
		if Input.is_action_pressed("ui_down"):
			direction.y += 1
		if Input.is_action_pressed("ui_up"):
			direction.y -= 1
		if Input.is_action_pressed("ui_left"):
			direction.x -= 1
		if Input.is_action_pressed("ui_right"):
			direction.x += 1

	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	# Update animation based on direction
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				sprite.animation = animation_["east"]
			else:
				sprite.animation = animation_["west"]
		else:
			if velocity.y > 0:
				sprite.animation = animation_["south"]
			else:
				sprite.animation = animation_["north"]
	else:
		sprite.animation = animation_["idle"]
	
	# Let Godot's physics engine handle collisions and sliding
	move_and_slide(velocity, Vector2.UP)

