extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	print("logaritmo")


#region Nuevo Code Region
func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		sprite.texture = InputIcon.get_icon_by_event(event)
#endregion
		
