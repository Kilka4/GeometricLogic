extends Area2D




func _on_ReachingTheNextLevel_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Scenes/LevelSelection.tscn")
