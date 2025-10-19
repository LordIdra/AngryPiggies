extends Node

var selected_part: PackedScene
var selected_part_selector: Node
@export var building_grid_square: PackedScene
@export var andersen: Node

func _ready() -> void:
	for x in 5:
		for y in 3:
			var square = building_grid_square.instantiate()
			square.name = "BuildingGridSquare-%s-%s" % [x, y]
			square.position.x = 250 + x * 64
			square.position.y = 100 + y * 64
			square.x = x
			square.y = y
			$BuildingGrid.add_child(square)

func _on_part_selected(selected_part_scene: PackedScene, selected_part_selector_: Node) -> void:
	selected_part = selected_part_scene
	selected_part_selector = selected_part_selector_

func _on_play_button_pressed() -> void:
	if andersen == null:
		return
	andersen.get_node("Camera2D").enabled = true
	for child in $BuildingGrid.get_children():
		child.queue_free()
	for child in $Vehicle.get_children():
		child.freeze = false
	$BuildingGrid.queue_free()
	$EmptySelector.queue_free()
	$AndersenSelector.queue_free()
	$BlockSelector.queue_free()
	$WheelSelector.queue_free()
	$PlayButton.queue_free()
