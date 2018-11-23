extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pressed 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	get_parent().get_parent().get_parent().get_node("popup_aprender").set("texture",load("res://TELAS/Aprendizado"+get_parent().get_parent().get_parent().get_parent().get_node("text_pergunta").subject))
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	#get_parent().get_parent().get_parent().get_node("popup_aprender").set("texture",load("res://TELAS/Aprendizado/mosquito/origem.jpg"))
	
	
	pass


func _input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch or (event is InputEventMouseButton and event.is_pressed()):
		pressed = true
		print("oheey")	
	elif(pressed == true):
		#get_tree().change_scene("res://scenes/Tela_aprender.tscn")
		get_parent().get_parent().get_parent().get_node("popup_aprender").set("visible",true)
		pressed = false
	pass
