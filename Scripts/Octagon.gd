extends KinematicBody2D

const SPEED = 75
const FLOOR = Vector2(0, -1)
const GRAVITY = 970

var velocity = Vector2()
var direction = 1
var is_alive = true

func kill():
	is_alive = false
	queue_free()

func change_direction():
	direction *= -1
	$Sprite.flip_h = !$Sprite.flip_h

func _physics_process(delta):
	if is_alive == true:
		velocity.x = SPEED * direction
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)
	if is_on_wall():
		change_direction()

func _on_Hitbox_body_entered(body):
	kill()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
