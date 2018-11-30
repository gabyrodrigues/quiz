extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if get_parent().get_parent().get_parent().get_parent().get_parent().get_node("menuButton/Area2D").menu == true:
			disabled = true
			mouse_filter = Control.MOUSE_FILTER_IGNORE
	else:
			disabled = false
			mouse_filter = Control.MOUSE_FILTER_STOP
	pass
func _pressed():
	print("presseddd")
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("popup_aprender").set("texture", load("res://TELAS/Aprendizado/mosquito/culex_aedes.jpg"))
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("popup_aprender").set("visible",true)
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("barragem2").set("visible",true)