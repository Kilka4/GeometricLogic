extends Area2D

signal Activated
signal Disabled
signal Triggered

var activated = false setget change_state

func _process(delta):
	pass

func _on_WhiteLever_body_entered(body):
	#ВАЖНО!!! self. нужен, чтобы функция сеттер работала
	#при изменении переменной родительского скрипта в годо 3+
	self.activated = !activated

func change_state(value):
	activated = value
	if activated == false:
		$AnimatedSprite.play("default")
		emit_signal("Disabled")
		emit_signal("Triggered", activated)
	else:
		$AnimatedSprite.play("activate")
		emit_signal("Activated")
		emit_signal("Triggered", activated)
