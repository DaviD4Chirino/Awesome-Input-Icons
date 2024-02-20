class_name ActionIconGlobal
const asset_path: StringName = &"res://addons/awesome_input_icons/assets/inputs prompts keyboard and mouse default/"


## it construct the path to the image
static func get_event_name_path(event_name: String, outline: bool = false) -> String:
	## We build the path, if you wanted an outline, it gets appended as a suffix
	var path_with_name: String = asset_path + event_name
	if outline:
		return path_with_name + "_outline" + ".png"
	return path_with_name + ".png"


## It checks if the file exists
static func event_has_icon(event_name: String, outline: bool = false) -> bool:
	return ResourceLoader.exists(get_event_name_path(event_name, outline))


## Performs a check if theres an icon image, if there is, it returns the path to be loaded
static func event_get_icon(event_name: String, outline: bool = false) -> String:
	if !event_has_icon(event_name, outline):
		return ""
	return get_event_name_path(event_name, outline)


## It takes an event and returns the icon, or null if it doesn't exist
static func get_icon(
	## The inputEvent to get the icon
	action: StringName,
	## The index of the event
	action_index: int,
	## If the icon should be outlined
	outline: bool = false
) -> Texture2D:
	## We get the event
	var events = InputMap.action_get_events(action)
	var event = events[action_index] if action_index < events.size() else null

	if !event:
		printerr("Event not found")
		return null

	## We perform a string conversion,
	## first converting it into snake_case,
	## then making sure is lowercase
	## and finally removing the (physical) in case it's there
	var event_name = event.as_text().to_lower().trim_suffix(" (physical)")
	event_name = event_name.replace(" ", "_")

	## We check if the event even has an icon
	var icon_path: String = event_get_icon(event_name, outline)
	if icon_path:
		return load(icon_path)
	## We delete the image if thats not the case
	else:
		return null
