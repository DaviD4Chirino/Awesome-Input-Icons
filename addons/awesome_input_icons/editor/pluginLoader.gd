@tool
extends EditorPlugin

const UPDATE_BUTTON_SCENE = preload ("res://addons/awesome_input_icons/editor/update_button.tscn")
var docker_scene = null

func _enter_tree():
	docker_scene = UPDATE_BUTTON_SCENE.instantiate()
