@tool
extends EditorPlugin

var editor_feature_profile := EditorFeatureProfile.new()

## All the classes this plugin adds to the editor
var all_classes: Array[StringName] = [
	&"InputIcon",
	&"InputIconScheme",
	&"InputIconConfiguration",
	&"InputIconSprite2D",
	&"InputIconSprite3D",
	&"InputIconTextureRect",
]


func _enter_tree():
	_set_disable_classes(false)


func _exit_tree():
	_set_disable_classes(true)


func _set_disable_classes(disable: bool) -> void:
	for string_name in all_classes:
		editor_feature_profile.set_disable_class(string_name, disable)
