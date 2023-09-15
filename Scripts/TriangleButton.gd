extends Area2D

signal Player_entered






func _on_TriangleButton_body_entered(body):
	if body.position == position && body.rotation_degrees == rotation_degrees:
		emit_signal("Player_entered")
		print("+")
