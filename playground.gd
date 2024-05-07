extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

#region Nuevo Code Region
func _input(event):
	if (
		event is InputEventKey and event.is_released()
		) or (
		is_correct_joypad_input(event) or is_correct_mouse_input(event)
	):
		sprite.texture = InputIcon.get_icon_by_event(event)

#endregion

func is_correct_joypad_input(event: InputEvent):
	var deadzone := 0.5
	return event is InputEventJoypadButton or (event is InputEventJoypadMotion and absf(event.axis_value) >= deadzone)

func is_correct_mouse_input(event: InputEvent):
	var deadzone: int = 10
	return event is InputEventMouseButton or (event is InputEventMouseMotion and abs(event.relative.length()) >= deadzone)
