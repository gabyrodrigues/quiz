extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass


func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		print("omg")
		get_tree().get_nodes_in_group("me_question")[0].currentAnswer = 1
		get_tree().get_nodes_in_group("me_question")[0].checkAnswer()
	pass	