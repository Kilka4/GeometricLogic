extends Camera2D

export var player_1 : NodePath
export var player_2 : NodePath
onready var p1 = get_node(player_1)
onready var p2 = get_node(player_2)

var global_rect := Rect2()

func _ready():
	if p1 != null && p2 != null:
		set_process(true)
	
	Global.current_camera2d = self

func _process(delta):
	update_global_rect()
	global_position = ((p1.global_position / 2) + (p2.global_position / 2))

func update_global_rect():
	var _v_size = get_viewport().size * zoom
	var _topleft_corner = get_camera_position() - (_v_size / 2)
	global_rect = Rect2(_topleft_corner, _v_size)
	update()
