extends Node

export(Array, NodePath) var parallax_nodes
export(Array, float) var parallax_strengths

var parallax_nodes_start_pos : Array

var screen_center := Vector2.ZERO

func _ready():
	for i in parallax_nodes.size():
		var node = get_node(parallax_nodes[i]) as Control
		parallax_nodes_start_pos.append(node.rect_global_position)
	screen_center = get_viewport().size / 2

func _process(delta):
	var mouse_offset = (get_viewport().get_mouse_position() - screen_center) / screen_center
	for i in parallax_nodes.size():
		var node = get_node(parallax_nodes[i]) as Control
		if node and i < parallax_strengths.size():
			var target_pos = parallax_nodes_start_pos[i] + (mouse_offset * parallax_strengths[i] * 50)
			node.rect_global_position = node.rect_global_position.linear_interpolate(target_pos, 5 * delta) # Adjust the 50 for more/less effect
