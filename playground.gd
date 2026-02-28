extends Node2D

@onready var sprite: Sprite2D = $Sprite2D


func _input(event):
	var is_key_event := event is InputEventKey
	var is_joypad_input := is_correct_joypad_input(event)
	var is_mouse_input := is_correct_mouse_input(event)

	if (is_key_event and event.is_pressed()) or (is_joypad_input or is_mouse_input):
		sprite.texture = InputIcon.get_icon_by_event(event)


func is_correct_joypad_input(event: InputEvent) -> bool:
	var deadzone := 0.5
	var is_joypad_button := event is InputEventJoypadButton
	var is_joypad_motion := event is InputEventJoypadMotion
	return is_joypad_button or (is_joypad_motion and absf(event.axis_value) >= deadzone)


func is_correct_mouse_input(event: InputEvent) -> bool:
	var deadzone: int = 10
	var is_mouse_button := event is InputEventMouseButton
	var is_mouse_motion := event is InputEventMouseMotion
	return is_mouse_button or (is_mouse_motion and abs(event.relative.length()) >= deadzone)
