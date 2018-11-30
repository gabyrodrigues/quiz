extends CheckButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if get_node("/root/global").sounds == true:
		set("pressed",true)
	else:
		set("pressed",false)
	pass

func _process(delta):
	
	pass

func _toggled(button_pressed):
	
	if pressed == true:
		get_node("/root/global").sounds = true
		print("s: ",get_node("/root/global").sounds)
		get_node("/root/music").set("playing",true)
	else:
		get_node("/root/global").sounds = false
		print("s: ",get_node("/root/global").sounds)
		get_node("/root/music").set("playing",false)
		
	pass
	
	pass