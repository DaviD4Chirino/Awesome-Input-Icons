## Global Class for all the script in the Awesome Input Icons plugin
class_name InputIcon
static var keys: Array[Key] = [
	KEY_NONE,
	KEY_SPECIAL,
	KEY_ESCAPE,
	KEY_TAB,
	KEY_BACKTAB,
	KEY_BACKSPACE,
	KEY_ENTER,
	KEY_KP_ENTER,
	KEY_INSERT,
	KEY_DELETE,
	KEY_PAUSE,
	KEY_PRINT,
	KEY_SYSREQ,
	KEY_CLEAR,
	KEY_HOME,
	KEY_END,
	KEY_LEFT,
	KEY_UP,
	KEY_RIGHT,
	KEY_DOWN,
	KEY_PAGEUP,
	KEY_PAGEDOWN,
	KEY_SHIFT,
	KEY_CTRL,
	KEY_META,
	KEY_ALT,
	KEY_CAPSLOCK,
	KEY_NUMLOCK,
	KEY_SCROLLLOCK,
	KEY_F1,
	KEY_F2,
	KEY_F3,
	KEY_F4,
	KEY_F5,
	KEY_F6,
	KEY_F7,
	KEY_F8,
	KEY_F9,
	KEY_F10,
	KEY_F11,
	KEY_F12,
	KEY_F13,
	KEY_F14,
	KEY_F15,
	KEY_F16,
	KEY_F17,
	KEY_F18,
	KEY_F19,
	KEY_F20,
	KEY_F21,
	KEY_F22,
	KEY_F23,
	KEY_F24,
	KEY_F25,
	KEY_F26,
	KEY_F27,
	KEY_F28,
	KEY_F29,
	KEY_F30,
	KEY_F31,
	KEY_F32,
	KEY_F33,
	KEY_F34,
	KEY_F35,
	KEY_KP_MULTIPLY,
	KEY_KP_DIVIDE,
	KEY_KP_SUBTRACT,
	KEY_KP_PERIOD,
	KEY_KP_ADD,
	KEY_KP_0,
	KEY_KP_1,
	KEY_KP_2,
	KEY_KP_3,
	KEY_KP_4,
	KEY_KP_5,
	KEY_KP_6,
	KEY_KP_7,
	KEY_KP_8,
	KEY_KP_9,
	KEY_MENU,
	KEY_HYPER,
	KEY_HELP,
	KEY_BACK,
	KEY_FORWARD,
	KEY_STOP,
	KEY_REFRESH,
	KEY_VOLUMEDOWN,
	KEY_VOLUMEMUTE,
	KEY_VOLUMEUP,
	KEY_MEDIAPLAY,
	KEY_MEDIASTOP,
	KEY_MEDIAPREVIOUS,
	KEY_MEDIANEXT,
	KEY_MEDIARECORD,
	KEY_HOMEPAGE,
	KEY_FAVORITES,
	KEY_SEARCH,
	KEY_STANDBY,
	KEY_OPENURL,
	KEY_LAUNCHMAIL,
	KEY_LAUNCHMEDIA,
	KEY_LAUNCH0,
	KEY_LAUNCH1,
	KEY_LAUNCH2,
	KEY_LAUNCH3,
	KEY_LAUNCH4,
	KEY_LAUNCH5,
	KEY_LAUNCH6,
	KEY_LAUNCH7,
	KEY_LAUNCH8,
	KEY_LAUNCH9,
	KEY_LAUNCHA,
	KEY_LAUNCHB,
	KEY_LAUNCHC,
	KEY_LAUNCHD,
	KEY_LAUNCHE,
	KEY_LAUNCHF,
	KEY_GLOBE,
	KEY_KEYBOARD,
	KEY_JIS_EISU,
	KEY_JIS_KANA,
	KEY_UNKNOWN,
	KEY_SPACE,
	KEY_EXCLAM,
	KEY_QUOTEDBL,
	KEY_NUMBERSIGN,
	KEY_DOLLAR,
	KEY_PERCENT,
	KEY_AMPERSAND,
	KEY_APOSTROPHE,
	KEY_PARENLEFT,
	KEY_PARENRIGHT,
	KEY_ASTERISK,
	KEY_PLUS,
	KEY_COMMA,
	KEY_MINUS,
	KEY_PERIOD,
	KEY_SLASH,
	KEY_0,
	KEY_1,
	KEY_2,
	KEY_3,
	KEY_4,
	KEY_5,
	KEY_6,
	KEY_7,
	KEY_8,
	KEY_9,
	KEY_COLON,
	KEY_SEMICOLON,
	KEY_LESS,
	KEY_EQUAL,
	KEY_GREATER,
	KEY_QUESTION,
	KEY_AT,
	KEY_A,
	KEY_B,
	KEY_C,
	KEY_D,
	KEY_E,
	KEY_F,
	KEY_G,
	KEY_H,
	KEY_I,
	KEY_J,
	KEY_K,
	KEY_L,
	KEY_M,
	KEY_N,
	KEY_O,
	KEY_P,
	KEY_Q,
	KEY_R,
	KEY_S,
	KEY_T,
	KEY_U,
	KEY_V,
	KEY_W,
	KEY_X,
	KEY_Y,
	KEY_Z,
	KEY_BRACKETLEFT,
	KEY_BACKSLASH,
	KEY_BRACKETRIGHT,
	KEY_ASCIICIRCUM,
	KEY_UNDERSCORE,
	KEY_QUOTELEFT,
	KEY_BRACELEFT,
	KEY_BAR,
	KEY_BRACERIGHT,
	KEY_ASCIITILDE,
	KEY_YEN,
	KEY_SECTION
]
static var mouse_buttons = [
	MOUSE_BUTTON_NONE,
	MOUSE_BUTTON_LEFT,
	MOUSE_BUTTON_RIGHT,
	MOUSE_BUTTON_MIDDLE,
	MOUSE_BUTTON_WHEEL_UP,
	MOUSE_BUTTON_WHEEL_DOWN,
	MOUSE_BUTTON_WHEEL_LEFT,
	MOUSE_BUTTON_WHEEL_RIGHT,
	MOUSE_BUTTON_XBUTTON1,
	MOUSE_BUTTON_XBUTTON2
]
static var joy_buttons = [
	JOY_BUTTON_INVALID,
	JOY_BUTTON_A,
	JOY_BUTTON_B,
	JOY_BUTTON_X,
	JOY_BUTTON_Y,
	JOY_BUTTON_BACK,
	JOY_BUTTON_GUIDE,
	JOY_BUTTON_START,
	JOY_BUTTON_LEFT_STICK,
	JOY_BUTTON_RIGHT_STICK,
	JOY_BUTTON_LEFT_SHOULDER,
	JOY_BUTTON_RIGHT_SHOULDER,
	JOY_BUTTON_DPAD_UP,
	JOY_BUTTON_DPAD_DOWN,
	JOY_BUTTON_DPAD_LEFT,
	JOY_BUTTON_DPAD_RIGHT,
	JOY_BUTTON_MISC1,
	JOY_BUTTON_PADDLE1,
	JOY_BUTTON_PADDLE2,
	JOY_BUTTON_PADDLE3,
	JOY_BUTTON_PADDLE4,
	JOY_BUTTON_TOUCHPAD,
	JOY_BUTTON_SDL_MAX,
	JOY_BUTTON_MAX
]
static var joy_axes = [
	JOY_AXIS_INVALID,
	JOY_AXIS_LEFT_X,
	JOY_AXIS_LEFT_Y,
	JOY_AXIS_RIGHT_X,
	JOY_AXIS_RIGHT_Y,
	JOY_AXIS_TRIGGER_LEFT,
	JOY_AXIS_TRIGGER_RIGHT,
	JOY_AXIS_SDL_MAX,
	JOY_AXIS_MAX
]

static var scheme = null:
	get = get_scheme

static var configuration = null:
	get = get_configuration


static func get_scheme() -> InputIconScheme:
	return configuration.scheme


static func get_configuration() -> InputIconConfiguration:
	return load("res://addons/awesome_input_icons/input_icon_configuration.tres")


static func get_icon(action: StringName, event_index: int = 0) -> Texture2D:
	var events: Array[InputEvent] = InputMap.action_get_events(action)

	if not events:
		printerr("Input Icon: No events found for action: " + action)
		return null

	if event_index > events.size():
		printerr("Input Icon: Invalid event index: " + str(event_index))
		return null

	var event: InputEvent = events[event_index]

	match event.get_class():
		"InputEventKey":
			var keycode = event.keycode if event.keycode else event.physical_keycode
			# return get_keycode_icon(keycode)
		_:
			printerr("Input Icon: Unsupported event type: " + str(event))

	return null

# static func get_keycode_icon(keycode: int) -> Texture2D:
# 	print_debug("Run")
# 	for element in scheme.list:
# 		if element.key == keycode:
# 			return element.icon
# 	push_warning(
# 		"Input Icon: No icon found for keycode: " + str(keycode) + " in the current scheme"
# 	)
# 	return null
