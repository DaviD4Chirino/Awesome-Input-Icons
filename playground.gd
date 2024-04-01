extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	print("logaritmo")


#region Nuevo Code Region
func _input(event):
	if event is InputEventKey or event is InputEventMouseButton or is_correct_joypad_input(event):
		sprite.texture = InputIcon.get_icon_by_event(event)
		
#endregion
		
func is_correct_joypad_input(event: InputEvent):
	var deadzone := 0.5
	return event is InputEventJoypadButton or (event is InputEventJoypadMotion and absf(event.axis_value) >= deadzone)
