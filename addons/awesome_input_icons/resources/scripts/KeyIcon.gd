@tool
extends Resource
class_name KeyIcon
enum InputTypes { KEYBOARD, MOUSE, JOY_BUTTON }
@export var input_type: InputTypes = InputTypes.KEYBOARD

## The keycode, its value depends on its type
@export var keycode: int = KEY_NONE:
	set = update_name

## And the image that represents that keycode
@export var icon: Texture2D


## For better readability in the editor, we change the resource name to the name of the key.
## The only easy one is to use the [param OS.get_keycode_string], the rest we have to do manually.
## Luckily apart from Keyboard, theres not a lot of them.
func update_name(value: int) -> void:
	keycode = value
	if not Engine.is_editor_hint():
		return

	match input_type:
		InputTypes.KEYBOARD:
			if keycode == KEY_SPECIAL:
				resource_name = "Special"
				return
			resource_name = OS.get_keycode_string(keycode)

		InputTypes.MOUSE:
			_update_name_mouse(keycode)

		InputTypes.JOY_BUTTON:
			_update_name_joy(keycode)


func _update_name_mouse(value: int) -> void:
	match value:
		MOUSE_BUTTON_LEFT:
			resource_name = "Left Mouse Button"

		MOUSE_BUTTON_RIGHT:
			resource_name = "Right Mouse Button"

		MOUSE_BUTTON_MIDDLE:
			resource_name = "Middle Mouse Button"

		MOUSE_BUTTON_WHEEL_UP:
			resource_name = "Mouse Wheel Up"

		MOUSE_BUTTON_WHEEL_DOWN:
			resource_name = "Mouse Wheel Down"

		MOUSE_BUTTON_WHEEL_LEFT:
			resource_name = "Mouse Wheel Left"

		MOUSE_BUTTON_WHEEL_RIGHT:
			resource_name = "Mouse Wheel Right"

		MOUSE_BUTTON_XBUTTON1:
			resource_name = "X Button 1"

		MOUSE_BUTTON_XBUTTON2:
			resource_name = "X Button 2"


func _update_name_joy(value: int) -> void:
	match value:
		JOY_BUTTON_INVALID:
			resource_name = "JOY Invalid"
		JOY_BUTTON_A:
			resource_name = "JOY A"

		JOY_BUTTON_B:
			resource_name = "JOY B"

		JOY_BUTTON_X:
			resource_name = "JOY X"

		JOY_BUTTON_Y:
			resource_name = "JOY Y"

		JOY_BUTTON_BACK:
			resource_name = "JOY Back"

		JOY_BUTTON_GUIDE:
			resource_name = "JOY Guide"

		JOY_BUTTON_START:
			resource_name = "JOY Start"

		JOY_BUTTON_LEFT_STICK:
			resource_name = "JOY Left Stick"

		JOY_BUTTON_RIGHT_STICK:
			resource_name = "JOY Right Stick"

		JOY_BUTTON_LEFT_SHOULDER:
			resource_name = "JOY Left Shoulder"

		JOY_BUTTON_RIGHT_SHOULDER:
			resource_name = "JOY Right Shoulder"

		JOY_BUTTON_DPAD_UP:
			resource_name = "JOY Dpad Up"

		JOY_BUTTON_DPAD_DOWN:
			resource_name = "JOY Dpad Down"

		JOY_BUTTON_DPAD_LEFT:
			resource_name = "JOY Dpad Left"

		JOY_BUTTON_DPAD_RIGHT:
			resource_name = "JOY Dpad Right"

		JOY_BUTTON_PADDLE1:
			resource_name = "JOY Paddle 1"

		JOY_BUTTON_PADDLE2:
			resource_name = "JOY Paddle 2"

		JOY_BUTTON_PADDLE3:
			resource_name = "JOY Paddle 3"

		JOY_BUTTON_PADDLE4:
			resource_name = "JOY Paddle 4"

		JOY_BUTTON_TOUCHPAD:
			resource_name = "JOY Touchpad"

		JOY_BUTTON_MISC1:
			resource_name = "JOY Misc 1"

		JOY_BUTTON_SDL_MAX:
			resource_name = "JOY SDL Max"

		JOY_BUTTON_MAX:
			resource_name = "JOY Max"
