@tool
extends Button
## Base code from Nathan Hoad [https://github.com/nathanhoad/godot_dialogue_manager]
## With help from BenjaTk 

const REMOTE_RELEASES_URL: String = "https://raw.githubusercontent.com/DaviD4Chirino/Awesome-Input-Icons/main/addons/awesome_input_icons/plugin.cfg"
const LOCAL_CONFIG_PATH: String = "res://addons/awesome_input_icons/plugin.cfg"

@onready var http_request: HTTPRequest = $HTTPRequest
@onready var download_dialog: AcceptDialog = $DownloadDialog
# @onready var download_update_panel = $DownloadDialog/DownloadUpdatePanel
# @onready var needs_reload_dialog: AcceptDialog = $NeedsReloadDialog
@onready var update_failed_dialog: AcceptDialog = $UpdateFailedDialog
@onready var update_success: AcceptDialog = $UpdateSuccess
@onready var timer: Timer = $Timer

# The main editor plugin
var editor_plugin: EditorPlugin
var needs_reload: bool = false

## A lambda that gets called just before refreshing the plugin. Return false to stop the reload.
var on_before_refresh: Callable = func(): return true

func _ready() -> void:
	hide()
	http_request.request(REMOTE_RELEASES_URL)

func _on_http_request_request_completed(
	result: int,
	response_code: int,
	headers: PackedStringArray,
	body: PackedByteArray
):
	if result != HTTPRequest.RESULT_SUCCESS: return

	var response: String = body.get_string_from_utf8()
	var regex: RegEx = RegEx.new()
	regex.compile("version=\"(\\d+\\.\\d+\\.\\d+)\"")

	var found: RegExMatch = regex.search(response)

	if !found: return
	
	var remote_version_string: String = found.strings[1]
	var remote_version: int = _version_to_number(found.strings[1])
	var local_version: int = _version_to_number(_get_version())
	
	# now we compare the remote to the local
	# we know the local is outdated if the remote is a bigger int

	if remote_version > local_version:
		text = "v%s available" % remote_version_string
		$DownloadDialog/DownloadUpdate.show()

	show()

	pass # Replace with function body.

func _on_pressed():
	download_dialog.popup_centered()
	# download_dialog.version
	
	pass # Replace with function body.

func _on_download_update_updated(to: String):
	download_dialog.hide()
	editor_plugin.get_editor_interface().get_resource_filesystem().scan()

	var will_refresh = on_before_refresh.call()
	if will_refresh:
		print_rich("\n[b]Updated Awesome Input Icons to v%s[/b]" % to)
		editor_plugin.get_editor_interface().call_deferred("set_plugin_enabled", true)
		editor_plugin.get_editor_interface().set_plugin_enabled(
			"Awesome Input Icons",
			false
		)
	
	update_success.popup_centered()
	
	pass # Replace with function body.

func _on_download_update_failed():
	update_failed_dialog.popup_centered()
	pass # Replace with function body.

## transform the "1.0.1" to 101 as a int
func _version_to_number(version: String) -> int:
	var regex: RegEx = RegEx.new()
	regex.compile("[0-9]")
	if !regex.search(version):
		push_error("Not a version string, it should look like: 1.0.0")
		return 0
		
	var sanitized_string: String = version.replace(".", "")
	var number: int = int(sanitized_string)
	return number

func _get_version() -> String:
	var config: ConfigFile = ConfigFile.new()

	config.load(LOCAL_CONFIG_PATH)
	return config.get_value("plugin", "version")
