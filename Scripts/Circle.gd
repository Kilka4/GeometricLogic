extends KinematicBody2D

var speed = 150
var jump_speed = -400
var gravity = 1200
var stop_on_slope: bool = false
var max_slides: int = 4
var floor_max_angle: float = 0.785398
var mass: float = 1
var inertia = 3
var direction = 1
var can_teleport = true

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("Player2rightarrow")
	var left = Input.is_action_pressed("Player2leftarrow")
	var jump = Input.is_action_just_pressed("Player2jumparrow")
	
	if jump && is_on_floor():
		jumping = true
		velocity.y = jump_speed
		$AnimationPlayer.play("jump")
	elif right:
		velocity.x += speed
		$Sprite.rotation_degrees += 10
		$Teleport/Sprite.rotation_degrees += 10
		$Teleport/Sprite.position.x = 144
		$Teleport/TeleportTrigger/CollisionShape2D.position.x = 72
		direction = 1
		if !is_on_floor():
			$Sprite.flip_h = false
			$Teleport/Sprite.flip_h = false
	elif left:
		velocity.x -= speed
		$Sprite.rotation_degrees -= 10
		$Teleport/Sprite.rotation_degrees -= 10
		$Teleport/Sprite.position.x = -144
		$Teleport/TeleportTrigger/CollisionShape2D.position.x = -72
		direction = -1
	
		if !is_on_floor():
			$Sprite.flip_h = true
			$Teleport/Sprite.flip_h = true
	
	if can_teleport == false:
		$Teleport/Sprite.modulate = Color("c75a5a5a")
	else:
		$Teleport/Sprite.modulate = Color("8dffffff")

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ENTER:
			if event.is_pressed():
				$Teleport/Sprite.show()       
			else:
				if can_teleport == true:
					$Teleport/Sprite.hide()
					global_position.x += 144 * direction
				else:
					$Teleport/Sprite.hide()


func _on_TeleportTrigger_body_entered(body):
	can_teleport = false

func _on_TeleportTrigger_body_exited(body):
	can_teleport = true


func _on_Transfer_body_entered(body):
	if body.is_in_group("Square") || body.is_in_group("Triangle"):
		body.gravity = 1
		body.position.x = position.x


func _on_Transfer_body_exited(body):
	body.gravity = 1200


func limit_pos_to_camera():
	var _camera_rect = Global.current_camera2d.global_rect as Rect2
	var _x_min = _camera_rect.position.x
	var _x_max = _x_min + _camera_rect.size.x
	global_position = Vector2(clamp(global_position.x, _x_min, _x_max), global_position.y)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping && is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1), stop_on_slope, max_slides, floor_max_angle, false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("Body"):
			collision.collider.apply_central_impulse(-collision.normal * inertia)
	limit_pos_to_camera()
