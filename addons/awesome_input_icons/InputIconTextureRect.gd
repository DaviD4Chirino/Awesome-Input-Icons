## This is a textureRect that takes an action name and automatically loads the proper icon
class_name InputIconTextureRect extends TextureRect
## The name of the action, it has to exist in the InputMap
@export var action: StringName = "":
	set(value):
		action = value
		if !action:
			texture = null
			return
		_update()

## The index of the event, to select if theres more than one
@export var event_index: int = 0:
	set(value):
		event_index = value
		_update()

## If the icon should be outlined
@export var outline: bool = false:
	set(value):
		outline = value
		_update()


## It updates the texture, this way all 3 properties gets updated at the same time
func _update():
	texture = InputIconGlobal.get_icon(action, event_index, outline)
