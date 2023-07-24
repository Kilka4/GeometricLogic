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
	if Global.level6Unlocked == true:
		level6.set_deferred("disabled", false)
	if Global.level7Unlocked == true:
		level7.set_deferred("disabled", false)
	if Global.level8Unlocked == true:
		level8.set_deferred("disabled", false)
	if Global.level9Unlocked == true:
		level9.set_deferred("disabled", false)
	if Global.level10Unlocked == true:
		level10.set_deferred("disabled", false)


func _on_Level1_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")


func _on_Level2_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level2.tscn")
