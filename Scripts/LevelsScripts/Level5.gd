extends Node2D


func _on_TransitionFor2Players_LevelUnlocked():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/EndOfTheGame.tscn")
