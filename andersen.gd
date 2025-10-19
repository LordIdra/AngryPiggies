extends RigidBody2D

@export var selector: Node

func _on_tree_entered() -> void:
	get_parent().get_parent().andersen = self
