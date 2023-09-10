extends StaticBody2D

signal Activated
signal Disabled

var activated = false

func _process(delta):
	if activated == false:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("activate")
	print($Timer.time_left)


func _on_activation_body_entered(body):
	if body != self && activated == false:
		activated = true
		emit_signal("Activated")


func _on_activation_body_exited(body):
	$Timer.start()


func _on_Timer_timeout():
	activated = false
	emit_signal("Disabled")
	$Timer.stop()
