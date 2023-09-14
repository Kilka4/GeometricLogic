 extends Node2D




func _on_TransitionFor2Players_LevelUnlocked():
	Global.level2For2PlayersUnlocked = true
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/LevelSelection.tscn")
