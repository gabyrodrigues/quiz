extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var menu = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	#get_parent().get_node("winPoints").set("text",String(get_node("/root/global").winPoints))
	pass
	
func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		menu = true
		
		get_parent().get_node("darkbg").set("visible",true)
		get_parent().get_node("menu").set("visible",true)
		get_parent().get_parent().get_node("botoes").set("visible",false)
		
		if get_parent().get_parent().has_node("barragem"):
			get_parent().get_parent().get_node("barragem").set("visible",true)
		#get_tree().get_nodes_in_group("scroll")[0].get_node("barragem").set("visible",true)
	pass	