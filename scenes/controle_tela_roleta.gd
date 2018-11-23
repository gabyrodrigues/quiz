extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	get_node("points").set("text",String(get_node("/root/global").points))
	get_node("lifes").set("text",String(get_node("/root/global").lifes))
	get_node("jumps").set("text",String(get_node("/root/global").jumps))
	pass
