## Global Class for all the script in the Awesome Input Icons plugin
class_name InputIcon

##NOTE: Since for now the configuration only contains the scheme, this may seem redundant, BUT, in the future you can add more things to the configuration.
static var configuration = load("res://addons/awesome_input_icons/input_icon_configuration.tres")

static var scheme = load("res://addons/awesome_input_icons/input_icon_configuration.tres").scheme


## The main function, give it an action in your [param InputMap] and a optional event index, it returns you a [param Texture2D] that represents the icon
static func get_icon(action: StringName, event_index: int = 0) -> Texture2D:
	var events: Array[InputEvent] = InputMap.action_get_events(action)

	if not events:
		printerr("Input Icon: No events found for action: " + action)
		return null

	if event_index > events.size():
		printerr("Input Icon: Invalid event index: " + str(event_index))
		return null

	var event: InputEvent = events[event_index]
	var icon: Texture2D = null

	## Since the [param key] value in the [param KeyIcon] depends on its type, we need to check the class of the event, once with the event class we can get the icon with proper type context

	return get_icon_by_event(event)


## [b]Tip:[/b] You can call this instead of get_icon if you only have an [param InputEvent]
static func get_icon_by_event(event: InputEvent) -> Texture2D:
	var icon: Texture2D = null

	## Since the [param key] value in the [param KeyIcon] depends on its type, we need to check the class of the event, once with the event class we can get the icon with proper type context

	match event.get_class():
		"InputEventKey":
			var keycode = event.keycode if event.keycode else event.physical_keycode
			icon = scheme.get_key_icon(keycode, KeyIcon.InputTypes.KEYBOARD).icon

		"InputEventMouseButton":
			icon = scheme.get_key_icon(event.button_index, KeyIcon.InputTypes.MOUSE).icon

		"InputEventJoypadButton":
			icon = scheme.get_key_icon(event.button_index, KeyIcon.InputTypes.JOY_BUTTON).icon

		_:
			printerr("Input Icon: Unsupported event type: " + str(event))

	return icon


#getters


static func get_configuration() -> InputIconConfiguration:
	return load("res://addons/awesome_input_icons/input_icon_configuration.tres")


## I want to get the scheme from the configuration, and i do not want to rewrite the [param load] code,
static func get_scheme() -> InputIconScheme:
	var config: Resource = get_configuration()
	return config.scheme
