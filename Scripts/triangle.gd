extends KinematicBody2D

var speed = 150
var jump_speed = -400
var gravity = 1200
var stop_on_slope: bool = false
var max_slides: int = 4
var floor_max_angle: float = 0.785398
var mass: float = 1
var inertia = 3
var can_shoot = true

var velocity = Vector2()
var jumping = false

const BULLET = preload("res://Scenes/Bullet.tscn")

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("Player3k")
	var left = Input.is_action_pressed("Player3h")
	var jump = Input.is_action_just_pressed("Player3jump")
	var shoot = Input.is_action_just_pressed("Player3Shoot")
	
	if jump && is_on_floor():
		jumping = true
		velocity.y = jump_speed
		$AnimationPlayer.play("jump")
	if right:
		velocity.x += speed
		$Sprite.flip_h = false
		$Position2D.position.x = abs($Position2D.position.x) * 1
	if left:
		velocity.x -= speed
		$Sprite.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x) * -1
	if shoot && can_shoot:
		can_shoot = false
		$Timer.start()
		var bullet = BULLET.instance()
		bullet.direction = sign($Position2D.position.x)
		bullet.position = $Position2D.global_position
		get_parent().add_child(bullet)


func _on_Timer_timeout():
	can_shoot = true

func _on_Transfer_body_entered(body):
	if body.is_in_group("Square") || body.is_in_group("Circle"):
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
