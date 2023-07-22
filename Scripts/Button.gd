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
	if body != self:
		activated = true
		emit_signal("Activated")


func _on_activation_body_exited(body):
	if body != self:
		activated = false
		emit_signal("Disabled")
