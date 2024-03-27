extends Control
const RELEASE_URL: String = "https://github.com/DaviD4Chirino/Awesome-Input-Icons/releases/tag/"

const TEMP_FILE_NAME = "user://temp.zip"
## An example version is 101 ("1.0.1")
@export var version: int = 0:
	set(new_ver):
		version = new_ver
		if $VBoxContainer/Version:
			$VBoxContainer/Version.text = "v%s available for download" % _number_to_version(version)

signal updated(to: String)
signal failed

func _on_download_button_pressed():
	$HTTPRequest.request(RELEASE_URL + _number_to_version(version) + ".zip")
	%DownloadButton.disabled = true
	%DownloadButton.text = "Downloading..."
	
	pass # Replace with function body.
func _on_http_request_request_completed(
	result: int,
	_response_code: int,
	_headers: PackedStringArray,
	body: PackedByteArray):
		
	if result != HTTPRequest.RESULT_SUCCESS:
		failed.emit()
		return
	
	# We save the zip file in a temp location
	_save_zip_file(body)

	# We delete the addon as preparation for the new install
	if DirAccess.dir_exists_absolute("res://addons/awesome_input_icons"):
		DirAccess.remove_absolute("res://addons/awesome_input_icons")

	# we read the zip file that we just downloaded
	var zip_reader: ZIPReader = ZIPReader.new()
	zip_reader.open(TEMP_FILE_NAME)
	var files: PackedStringArray = zip_reader.get_files()
	var base_path = files[1]

	#remove the archive folder
	files.remove_at(0)
	#remove the assets folder
	files.remove_at(0)

	for path in files:
		var new_file_path: String = path.replace(base_path, "")
		if path.ends_with("/"):
			DirAccess.make_dir_recursive_absolute("res://addons/%s" % new_file_path)
		else:
			var file: FileAccess = FileAccess.open("res://addons/,%s" % new_file_path, FileAccess.WRITE)
			file.store_buffer(zip_reader.read_file(path))
	
	zip_reader.close()

	DirAccess.remove_absolute(TEMP_FILE_NAME)

	updated.emit(_number_to_version(version))
	
func _number_to_version(_version: int) -> String:
	var version_string: String = str(_version)
	var numbers: PackedStringArray = version_string.split()
	var sanitized_version: String = ".".join(numbers)
	return sanitized_version

func _save_zip_file(bytes: PackedByteArray):
	var file: FileAccess = FileAccess.open(TEMP_FILE_NAME, FileAccess.WRITE)
	file.store_buffer(bytes)
	file.flush()