extends StaticBody2D

export(Array, NodePath)  var triggering_node_paths
var triggering_nodes = []

func _ready():
	if triggering_node_paths:
		for path in triggering_node_paths:
			var _node = get_node(path)
			_node.connect("Triggered", self, "_on_trigger")
			triggering_nodes.append(_node)


func _on_trigger(value):
	if value:
		turn_on()
	else:
		turn_off()
	pass

func turn_on():
	for i in 1:
			global_position.y -= 32

func turn_off():
	for i in 1:
			global_position.y += 32

func _on_Button_Activated():
	for i in 1:
			global_position.y -= 32

func _on_Lever_Activated():
	for i in 1:
			global_position.y -= 32

func _on_Button_Disabled():
	for i in 1:
			global_position.y += 32

func _on_Lever_Disabled():
	for i in 1:
			global_position.y += 32
