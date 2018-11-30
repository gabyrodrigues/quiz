extends TextEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_email_focus_entered():
	print("hi")
	print(get("rect_position"))
	get_parent().set("position",Vector2(0,-200))
	pass 


func _on_email_focus_exited():
	get_parent().set("position",Vector2(0,0))
	pass
	


func _on_email_mouse_exited():
	get_parent().set("position",Vector2(0,0))
	pass 
