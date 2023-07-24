extends Sprite

signal LevelUnlocked

var triangle_entered = false
var square_entered = false
var circle_entered = false


func _on_Trigger_body_entered(body):
	if triangle_entered == true && square_entered == true && circle_entered == true:
		emit_signal("LevelUnlocked")
		print("Next Level")
