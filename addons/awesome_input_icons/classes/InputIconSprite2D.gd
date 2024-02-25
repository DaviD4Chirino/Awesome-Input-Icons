## This is a sprite2d that takes an action name and automatically loads the proper icon
extends Sprite2D
class_name InputIconSprite2D
@export var action_name: StringName
@export var event_index: int = 0


func _ready():
	texture = InputIcon.get_icon(action_name, event_index)
