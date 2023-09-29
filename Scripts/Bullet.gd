extends Area2D

var speed = 5
var velocity = Vector2()
var direction = 1

func _physics_process(delta):
	velocity.x = speed * direction
	if direction == -1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Bullet_body_entered(body):
	if body.name == "Target":
		body.activate()
		queue_free()
	else:
		queue_free()

