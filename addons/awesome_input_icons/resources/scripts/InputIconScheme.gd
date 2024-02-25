# @tool
extends Resource
class_name InputIconScheme
@export var list: Array[KeyIcon]

## For fast creation of keys, uncomment this and add @tool at the top of the script
# func _init():
# 	if list == null:
# 		list = []
# 	for key in InputIcon.keys:
# 		var icon = KeyIcon.new()
# 		icon.key = key
# 		list.append(icon)
