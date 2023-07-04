extends StaticBody2D

func _on_WhiteButton_Activated():
	for i in 1:
			global_position.y -= 32

func _on_WhiteLever_Activated():
	for i in 1:
			global_position.y -= 32

func _on_WhiteButton_Disabled():
	for i in 1:
			global_position.y += 32

func _on_WhiteLever_Disabled():
	for i in 1:
			global_position.y += 32
