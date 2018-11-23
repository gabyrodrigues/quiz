extends Area2D


func _ready():

	pass

func _process(delta):
	
	pass
func _input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed():
		get_tree().change_scene("res://scenes/main.tscn")

	pass
