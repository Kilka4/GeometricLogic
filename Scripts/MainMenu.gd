extends Control






func _on_PlayButton_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/LevelSelection.tscn")


func _on_QuitButton_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().quit()
