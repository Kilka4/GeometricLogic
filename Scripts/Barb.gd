extends Area2D



func _on_Barb_body_entered(body):
	get_tree().reload_current_scene()
