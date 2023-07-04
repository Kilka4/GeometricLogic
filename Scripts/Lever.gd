extends Area2D

signal Activated
signal Disabled

var activated = false

func _process(delta):
	if activated == false:
		$AnimatedSprite.play("default")
		emit_signal("Disabled")
	else:
		$AnimatedSprite.play("activate")
		emit_signal("Activated")

func _on_WhiteLever_body_entered(body):
	activated = !activated
