extends RigidBody2D

var wheel = self
var speed = 1300

func _process(delta: float):
	if Input.is_action_pressed("ui_right"):
		wheel.apply_torque_impulse(speed * delta * 60)
	elif Input.is_action_pressed("ui_left"):
		wheel.apply_torque_impulse(-speed * delta * 60)
