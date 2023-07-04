extends RigidBody2D

var velocity : Vector2
var direction : Vector2
var speed : float = 50

func _process(delta):
	if direction.x > 0:
		apply_central_impulse(Vector2(speed, 0))
	elif direction.x < 0:
		apply_central_impulse(Vector2(-speed, 0))
	else:
		apply_central_impulse(Vector2(0, 0))
