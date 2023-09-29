extends StaticBody2D


func _on_Target_hit():
	queue_free()
