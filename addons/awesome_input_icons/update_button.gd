@tool
extends Button

# const DialogueConstants = preload ("../constants.gd")
# const DialogueSettings = preload ("../settings.gd")

const REMOTE_RELEASES_URL: String = "https://raw.githubusercontent.com/DaviD4Chirino/Awesome-Input-Icons/main/addons/awesome_input_icons/plugin.cfg"
const LOCAL_CONFIG_PATH: String = "res://addons/awesome_input_icons/plugin.cfg"

@onready var http_request: HTTPRequest = $HTTPRequest
@onready var download_dialog: AcceptDialog = $DownloadDialog
# @onready var download_update_panel = $DownloadDialog/DownloadUpdatePanel
# @onready var needs_reload_dialog: AcceptDialog = $NeedsReloadDialog
@onready var update_failed_dialog: AcceptDialog = $UpdateFailedDialog
@onready var timer: Timer = $Timer

# The main editor plugin
# var editor_plugin: EditorPlugin

var needs_reload: bool = false

# var on_before_refresh: Callable = func(): return true

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
	regex.compile("version=\"(\\d+\\.\\d+)\"")

	var found = regex.search(response)

	print(response)
	print(found)
	pass # Replace with function body.

func _get_version() -> String:
	var config: ConfigFile = ConfigFile.new()

	config.load(LOCAL_CONFIG_PATH)
	return config.get_value("plugin", "version")