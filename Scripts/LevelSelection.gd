extends Control

onready var level2 = $VBoxContainer/HBoxContainer/Level2
onready var level3 = $VBoxContainer/HBoxContainer/Level3
onready var level4 = $VBoxContainer/HBoxContainer/Level4
onready var level5 = $VBoxContainer/HBoxContainer/Level5
onready var level6 = $VBoxContainer/HBoxContainer2/Level6
onready var level7 = $VBoxContainer/HBoxContainer2/Level7
onready var level8 = $VBoxContainer/HBoxContainer2/Level8
onready var level9 = $VBoxContainer/HBoxContainer2/Level9
onready var level10 = $VBoxContainer/HBoxContainer2/Level10

func _process(delta):
	if Global.level2Unlocked == true:
		level2.set_deferred("disabled", false)
	if Global.level3Unlocked == true:
		level3.set_deferred("disabled", false)
	if Global.level4Unlocked == true:
		level4.set_deferred("disabled", false)
	if Global.level5Unlocked == true:
		level5.set_deferred("disabled", false)


func _on_Level1_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")


func _on_Level2_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/Level2.tscn")


func _on_Level3_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/Level3.tscn")


func _on_Level4_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/Level4.tscn")


func _on_Level5_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/Level5.tscn")
