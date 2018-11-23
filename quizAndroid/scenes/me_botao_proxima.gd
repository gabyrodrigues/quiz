extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pressed = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	#get_parent().get_parent().get_node("acertou/winPoints").set("text","aa")
	#get_parent().get_node("winPoints").set("text",String(get_node("/root/global").winPoints))
	#get_parent().get_node("bonus").set("text",String(get_node("/root/global").bonus))
	
	pass


func _input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch or (event is InputEventMouseButton and event.is_pressed()):
		pressed = true
		print("oheey")	
	elif(pressed == true):
		get_tree().change_scene("res://scenes/Tela_roleta.tscn")
		pressed = false
	pass	