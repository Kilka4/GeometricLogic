extends StaticBody2D


var activated = false

func _process(delta):
	if activated == false:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("activate")


func _on_activation_body_entered(body):
	activated = true
	$activationWall/CollisionShape2D.set_deferred("disabled", false)
	$NotactivayionWall/CollisionShape2D.set_deferred("disabled", true)


func _on_activation_body_exited(body):
	activated = false
	$activationWall/CollisionShape2D.set_deferred("disabled", true)
	$NotactivayionWall/CollisionShape2D.set_deferred("disabled", false)


func _on_activationWall_body_entered(body):
	if body.is_in_group("Wall"):
		body.global_position.y -= 32


func _on_NotactivayionWall_body_entered(body):
	if body.is_in_group("Wall"):
		body.global_position.y += 32
