extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ra = 0
var points = 0
var lifes = 5
var jumps = 5
var winPoints = 25
var bonus = 1.0
var winStreak = 0.0
var wait = false
var node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if points < 0:
		points = 0
	
	if lifes < 0:
		lifes = 0
	
	if jumps < 0:
		jumps = 0
		
	bonus = 1 + winStreak/10
	points = int(points)
	
	if wait == true:
		print("time: ", get_node("/root/load_bt").get("time_left") )
		if get_node("/root/load_bt").get("time_left") == 0:
			node.set("visible",true)
			wait = false
	pass

func wait(n):
	get_node("/root/load_bt").start()
	wait = true
	node = n
	pass