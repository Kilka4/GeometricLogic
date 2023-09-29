extends StaticBody2D

signal hit



func activate():
	$AnimatedSprite.play("activate")
	emit_signal("hit")
