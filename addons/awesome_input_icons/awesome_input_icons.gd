@tool
extends EditorPlugin
const UPDATE_BUTTON_SCENE = preload ("res://addons/awesome_input_icons/editor/update_button.tscn")
var docker_scene = null

func _enter_tree():
	docker_scene = UPDATE_BUTTON_SCENE.instantiate()
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, docker_scene)

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, docker_scene)
	docker_scene.free()
	pass
