extends Node2D



func _on_ReachingTheNextLevel_LevelUnlocked():
	Global.level2Unlocked = true
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/LevelSelection.tscn")
