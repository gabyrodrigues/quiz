extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		#get_parent().get_parent().get_node("botoes").set("visible",true)
		get_node("/root/global").wait(get_parent().get_parent().get_node("botoes"))
		get_parent().get_parent().get_node("menuButton").set("visible",true)
		
		get_parent().set("visible",false)
		
		get_parent().get_parent().get_node("botoes/presente").set("visible",false)
		get_parent().get_parent().get_node("presente").set("texture",load("res://TELAS/Icones/presente_aberto.png"))
		get_node("/root/global").lifes += 10
		get_node("/root/global").jumps += 10
		get_node("/root/global").presentDay = get_node("/root/global").weekDay
		get_node("/root/global").saveData()
	pass