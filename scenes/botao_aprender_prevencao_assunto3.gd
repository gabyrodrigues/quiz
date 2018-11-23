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
	if event is InputEventScreenTouch or (event is InputEventMouseButton and event.is_pressed()):
		get_parent().get_parent().get_node("popup_aprender").set("texture", load("res://TELAS/Aprendizado/prevencao_e_combate/fumace.jpg"))
		get_parent().get_parent().get_node("popup_aprender").set("visible",true)
		
		get_parent().get_parent().get_node("menuButton").set("visible",false)
		get_parent().set("visible",false)
	pass
