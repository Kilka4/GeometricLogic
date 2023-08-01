extends Sprite

signal LevelUnlocked

var triangle_entered = false
var square_entered = false
var circle_entered = false
var name_body = ["Square", "Circle", "Triangle"]
var body_entered = []


func _on_Trigger_body_entered(body):
	print("body", body_entered)
	if name_body.has(body.name) && !body_entered.has(body):
		body_entered += [body]
		print("body_entered", body_entered)
		if body_entered.size() == 3:
			emit_signal("LevelUnlocked")
			print("Next Level")


func _on_Trigger_body_exited(body):
	if body_entered.has(body):
		body_entered.erase(body)
