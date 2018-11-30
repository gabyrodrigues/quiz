extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass


func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		
		if get_node("/root/global").sounds == true:
			get_node("/root/music/btSound").play(0)
			
		get_tree().change_scene("res://scenes/Tela_aprender_mosquito.tscn")
	pass	