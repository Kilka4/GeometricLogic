extends Area2D


signal Player_entered


func _on_Key_body_entered(body):
	emit_signal("Player_entered")
	queue_free()
