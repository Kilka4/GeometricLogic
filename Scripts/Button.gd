extends StaticBody2D

signal Activated
signal Disabled

var activated = false

func _process(delta):
	if activated == false:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("activate")


func _on_activation_body_entered(body):
	activated = true
	emit_signal("Activated")


func _on_activation_body_exited(body):
	activated = false
	emit_signal("Disabled")
