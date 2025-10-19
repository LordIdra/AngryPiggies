extends Node

@export var part_selected: Texture2D
@export var building_grid_square: PackedScene

func _ready() -> void:
	for x in 5:
		for y in 3:
			var square = building_grid_square.instantiate()
			square.position.x = 250 + x * 80
			square.position.y = 100 + y * 80
			$BuildingGrid.add_child(square)

func _on_part_selected(texture: Texture2D) -> void:
	part_selected = texture
 
