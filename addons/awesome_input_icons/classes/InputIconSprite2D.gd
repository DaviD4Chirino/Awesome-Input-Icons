## This is a sprite2d that takes an action name and automatically loads the proper icon
extends Sprite2D
class_name InputIconSprite2D


func _ready():
	print(InputIcon.scheme.list)
