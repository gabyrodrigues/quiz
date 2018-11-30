extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):

	pass
	
func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		get_parent().get_parent().get_node("Area2D").menu = false;
		
		get_parent().get_parent().get_node("darkbg").set("visible",false)
		get_parent().get_parent().get_node("menu").set("visible",false)
		get_parent().get_parent().get_parent().get_node("botoes").set("visible",true)
		
		if get_parent().get_parent().has_node("barragem"):
			get_parent().get_parent().get_node("barragem").set("visible",false)
		#get_tree().get_nodes_in_group("scroll")[0].get_node("barragem").set("visible",false)
	pass	