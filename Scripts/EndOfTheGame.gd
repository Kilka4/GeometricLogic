extends Control





func _on_Timer_timeout():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
