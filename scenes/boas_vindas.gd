extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_node("/root/global").wait(get_parent().get_node("botoes"))
	
	get_parent().get_node("avatar").set("texture",load("res://TELAS/avatares/avatar"+String(get_node("/root/global").avatar)+".png"))
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
