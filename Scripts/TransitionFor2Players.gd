extends Sprite

signal LevelUnlocked


var name_body = ["Square", "Circle"]
var body_entered = []


func _on_Trigger_body_entered(body):
	if name_body.has(body.name) && !body_entered.has(body):
		body_entered += [body]
		if body_entered.size() == 2:
			emit_signal("LevelUnlocked")


func _on_Trigger_body_exited(body):
	if body_entered.has(body):
		body_entered.erase(body)
