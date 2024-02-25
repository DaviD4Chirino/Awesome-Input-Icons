@tool
extends Resource
class_name KeyIcon

## The keycode
@export var key: Key = KEY_NONE:
	set(value):
		key = value
		resource_name = OS.get_keycode_string(key)

## And the image that represents that keycode
@export var icon: Texture2D
