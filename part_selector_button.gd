extends TextureButton

signal part_selected(texture: Texture2D)

func _on_pressed() -> void:
	part_selected.emit(texture_normal)
