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
		
		get_parent().get_parent().get_node("darkbg").set("visible",false)
		get_parent().get_parent().get_node("pop_up_sair").set("visible",false)
			
		get_node("/root/global").wait(get_parent().get_parent().get_parent().get_node("botoes"))
		get_parent().get_parent().get_node("sair_bt").set("visible",true)
		get_parent().get_parent().get_node("pular_bt").set("visible",true)
		get_parent().get_parent().get_parent().get_node("Timer").set("paused",false)
	pass	