extends Node

var current_camera2d: Camera2D
var level2Unlocked: bool = false
var level3Unlocked: bool = false
var level4Unlocked: bool = false
var level5Unlocked: bool = false
var level2For2PlayersUnlocked: bool = false
var level3For2PlayersUnlocked: bool = false
var level4For2PlayersUnlocked: bool = false
var level5For2PlayersUnlocked: bool = false


func save_file(value):
	var file = File.new()
	file.open("res://save.dat", File.WRITE)
	file.store_var(value)
	file.close()

func load_file():
	var file = File.new()
	file.open("res://save.dat", File.READ)
	var value = file.get_as_text()
	file.close()
	return value
