extends KinematicBody2D

var speed = 150
var jump_speed = -400
var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("d")
	var left = Input.is_action_pressed("a")
	var jump = Input.is_action_just_pressed("jump")
	
	if jump && is_on_floor():
		jumping = true
		velocity.y = jump_speed
		$AnimationPlayer.play("jump")
	elif right:
		velocity.x += speed
		$Sprite.rotation_degrees += 10
		if !is_on_floor():
			$Sprite.flip_h = false
	elif left:
		velocity.x -= speed
		$Sprite.rotation_degrees -= 10
		if !is_on_floor():
			$Sprite.flip_h = true

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping && is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
