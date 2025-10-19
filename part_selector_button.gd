extends TextureButton

signal part_selected(selected_part_scene: PackedScene, selected_part_selector: Node)

@export var selected_part_scene: PackedScene
@export var remaining: int

func _on_pressed() -> void:
	part_selected.emit(selected_part_scene, self)

func adjust_remaining(amount: int) -> void:
	remaining += amount
	if selected_part_scene != null:
		$Label.text = str(remaining)

func _on_tree_entered() -> void:
	if selected_part_scene != null:
		$Label.text = str(remaining)
