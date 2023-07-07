extends Camera2D

export var player_1 : NodePath
export var player_2 : NodePath
export var player_3 : NodePath
onready var p1 = get_node(player_1)
onready var p2 = get_node(player_2)
onready var p3 = get_node(player_3)

func _ready():
	if p1 != null && p2 != null && p3 != null:
		set_process(true)

func _process(delta):
	global_position = ((p1.global_position / 3) + (p2.global_position / 3) + (p3.global_position / 3))
