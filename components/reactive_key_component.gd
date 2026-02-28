extends Node

class_name ReactiveKeyComponent
## It reacts to any key godot emits, keboard, mouse, joy, etc.
## then it tries to call the [func InputIcon.get_icon] function to teh provided sprite
## no matter if its Sprite2D or TextureRect or whatever
## if it has an texture property, it will use that, otherwise it do nothing (but print a warning)

## It NEEDS to have a .texture property
@export var texture_handler: Node

# func _ready() -> void:
# 	assert(sprite., "The sprite needs to have a texture property")


func _ready() -> void:
	assert(texture_handler != null, "Texture handler is not set")
	assert(texture_handler.get(&"texture") != null, "The texture_handler needs to have a texture property")


func _input(event):
	var is_key_event := event is InputEventKey
	var is_joypad_input := is_correct_joypad_input(event)
	var is_mouse_input := is_correct_mouse_input(event)

	if (is_key_event and event.is_pressed()) or (is_joypad_input or is_mouse_input):
		var texture := InputIcon.get_icon_by_event(event)
		_update_texture(texture)


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


func _update_texture(texture: Texture2D) -> void:
	texture_handler.set(&"texture", texture)
