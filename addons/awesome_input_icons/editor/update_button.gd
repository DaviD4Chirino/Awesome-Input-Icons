@tool
extends Button
## Base code by Nathan Hoad (https://github.com/nathanhoad)
## at https://github.com/nathanhoad/godot_dialogue_manager

const RELEASES_URL: String = "https://api.github.com/repos/DaviD4Chirino/Awesome-Input-Icons/releases"
const LOCAL_CONFIG_PATH: String = "res://addons/awesome_input_icons/plugin.cfg"

var editor_plugin: EditorPlugin

@onready var http_request: HTTPRequest = $HTTPRequest
@onready var download_dialog: AcceptDialog = $DownloadDialog
@onready var update_failed_dialog: AcceptDialog = $UpdateFailedDialog
@onready var download_update_panel: Control = $DownloadDialog/DownloadUpdate

func _ready() -> void:
	hide()
	_check_for_update()

func _check_for_update() -> void:
	http_request.request(RELEASES_URL)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != HTTPRequest.RESULT_SUCCESS:
		return

	var current_version: String = _get_version()
	if current_version == null:
		push_error("Cannot find the current Awesome Input Icons version...")
		return

	var response = JSON.parse_string(body.get_string_from_utf8())
	if not (response is Array):
		return

	# GitHub releases are in order of creation, not order of version

	var versions = (response as Array).filter(
		func(release):
			var version: String=release.tag_name

			return _version_to_number(version) > _version_to_number(current_version))

	if versions.size() > 0:
		download_update_panel.next_version_release = versions[0]

		text = "Awesome Input Icons v%s available" % versions[0].tag_name
		show()

func _on_pressed() -> void:
	download_dialog.popup_centered()

func _on_download_update_panel_failed() -> void:
	download_dialog.hide()
	update_failed_dialog.popup_centered()

func _on_download_update_updated(new_version: String):
	download_dialog.hide()

	editor_plugin.get_editor_interface().get_resource_filesystem().scan()

	print_rich("\n[b]Updated Awesome Input Icons to v%s\n" % new_version)
	editor_plugin.get_editor_interface().call_deferred("set_plugin_enabled", "awesome_input_icons", true)
	editor_plugin.get_editor_interface().set_plugin_enabled("awesome_input_icons", false)

func _get_version() -> String:
	var config: ConfigFile = ConfigFile.new()

	config.load(LOCAL_CONFIG_PATH)
	return config.get_value("plugin", "version")

func _version_to_number(version: String) -> int:
	return version.replace(".", "").to_int()
