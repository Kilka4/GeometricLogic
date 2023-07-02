extends Area2D

var activated = false

func _process(delta):
	if activated == false:
		$AnimatedSprite.play("default")
		$ActivationWall/CollisionShape2D.set_deferred("disabled", true)
		$NotActivationWall/CollisionShape2D.set_deferred("disabled", false)
		
	else:
		$AnimatedSprite.play("activate")
		$ActivationWall/CollisionShape2D.set_deferred("disabled", false)
		$NotActivationWall/CollisionShape2D.set_deferred("disabled", true)

func _on_WhiteLever_body_entered(body):
	activated = !activated


func _on_ActivationWall_body_entered(body):
	if body.is_in_group("Wall"):
		body.global_position.y -= 32


func _on_NotActivationWall_body_entered(body):
	if body.is_in_group("Wall"):
		body.global_position.y += 32
