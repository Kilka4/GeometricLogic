extends Control

onready var level2 = $VBoxContainer/HBoxContainer2/Level2
onready var level3 = $VBoxContainer/HBoxContainer2/Level3
onready var level4 = $VBoxContainer/HBoxContainer2/Level4
onready var level5 = $VBoxContainer/HBoxContainer2/Level5
onready var level2For2Players = $VBoxContainer/HBoxContainer/Level2For2Players
onready var level3For2Players = $VBoxContainer/HBoxContainer/Level3For2Players
onready var level4For2Players = $VBoxContainer/HBoxContainer/Level4For2Players
onready var level5For2Players = $VBoxContainer/HBoxContainer/Level5For2Players

func _process(delta):
	if Global.level2Unlocked == true:
		level2.set_deferred("disabled", false)
	if Global.level3Unlocked == true:
		level3.set_deferred("disabled", false)
	if Global.level4Unlocked == true:
		level4.set_deferred("disabled", false)
	if Global.level5Unlocked == true:
		level5.set_deferred("disabled", false)
	if Global.level2For2PlayersUnlocked == true:
		level2For2Players.set_deferred("disabled", false)
	if Global.level3For2PlayersUnlocked == true:
		level3For2Players.set_deferred("disabled", false)
	if Global.level4For2PlayersUnlocked == true:
		level4For2Players.set_deferred("disabled", false)
	if Global.level5For2PlayersUnlocked == true:
		level5For2Players.set_deferred("disabled", false)


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


func _on_Level1For2Players_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/2PlayersLevel1.tscn")


func _on_Level2For2Players_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/2PlayersLevel2.tscn")


func _on_Level3For2Players_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/2PlayersLevel3.tscn")


func _on_Level4For2Players_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/2PlayersLevel4.tscn")


func _on_Level5For2Players_pressed():
	$Transition.play("Transition")
	yield($Transition, "animation_finished")
	get_tree().change_scene("res://Scenes/Levels/2PlayersLevel5.tscn")
