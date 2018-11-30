extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	#get_parent().get_node("winPoints").set("text",String(get_node("/root/global").winPoints))
	pass
	
func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		
		if get_node("/root/global").sounds == true:
			get_node("/root/music/btSound").play(0)
			
		get_parent().get_node("darkbg").set("visible",true)
		get_parent().get_node("pop_up_pular").set("visible",true)
		get_parent().get_parent().get_node("Timer").set("paused",true)
			
		get_parent().get_parent().get_node("botoes").set("visible",false)
		get_parent().get_node("sair_bt").set("visible",false)
		set("visible",false)

		#get_tree().get_nodes_in_group("roda")[0].get_node("Area2D").set("visible",false)
	pass	