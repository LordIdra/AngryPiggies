extends TextureButton

var part: Texture2D

func _on_pressed() -> void:
	var part_selected = get_parent().get_parent().part_selected
	part = part_selected
	$TextureRect.texture = part_selected
