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
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass


func _input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch or (event is InputEventMouseButton and event.is_pressed()):
		pressed = true
		print("ihu")
	elif(pressed == true):
		print("ihun")
		get_tree().get_nodes_in_group("com_question")[0].currentAnswer = 4
		get_tree().get_nodes_in_group("com_question")[0].checkAnswer()
		pressed = false
	pass	