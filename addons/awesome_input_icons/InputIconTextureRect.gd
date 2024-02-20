class_name InputIconTextureRect
extends TextureRect
## This is a textureRect that takes an action name and automatically loads the proper icon
@export var action: StringName
@export var action_index: int
@export var outline: bool = false


func _ready():
	get_action_icon()


func get_action_icon() -> void:
	if !action:
		return
	texture = ActionIconGlobal.get_icon(action, action_index, outline)
