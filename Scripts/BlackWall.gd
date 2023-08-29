extends StaticBody2D


func _on_BlackButton_Activated():
	for i in 1:
			global_position.y -= 32

func _on_BlackButton_Disabled():
	for i in 1:
			global_position.y += 32
