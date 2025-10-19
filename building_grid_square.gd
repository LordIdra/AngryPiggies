extends TextureButton

var part: Node
@export var x: int
@export var y: int
@export var selector: Node

func join(from: Node, to: Node, offset: Vector2):
	var joint = PinJoint2D.new()
	joint.scale = Vector2(0.0001, 0.0001)
	joint.position = offset * 10
	joint.disable_collision = false
	joint.softness = 0.5
	var orthogonal = Vector2(offset.y, offset.x)
	joint.position += orthogonal * 20
	joint.node_a = from.get_path()
	joint.node_b = to.get_path()
	if (offset.x != 0):
		joint.rotation = -PI / 2
	from.add_child(joint)

func try_create_joint(xoffset, yoffset):
	var other_square = get_parent().get_node_or_null("BuildingGridSquare-%s-%s" % [x+xoffset, y+yoffset])
	if other_square != null && other_square.part != null:
		var other_part = other_square.part
		join(part, other_part, Vector2(xoffset, yoffset))
		join(other_part, part, Vector2(-xoffset, -yoffset))

func _on_pressed() -> void:
	var selected_part_scene = get_parent().get_parent().selected_part
	var selected_part_selector = get_parent().get_parent().selected_part_selector
	
	if part != null:
		part.queue_free()
		part.selector.adjust_remaining(1)
	
	if selected_part_scene == null:
		return
	
	if selected_part_selector.remaining <= 0:
		return
	
	selected_part_selector.adjust_remaining(-1)
	
	part = selected_part_scene.instantiate()
	part.selector = selected_part_selector
	part.position = position + size / 2 + Vector2(1, 1)
	get_parent().get_parent().get_node("Vehicle").add_child(part)
	
	try_create_joint(1, 0)
	try_create_joint(-1, 0)
	try_create_joint(0, 1)
	try_create_joint(0, -1)
