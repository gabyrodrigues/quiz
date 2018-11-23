extends Area2D

var canSpin
var d
var turns
var speed
var downSpeed

func _ready():
	canSpin = false
	speed = 20
	d =0
	downSpeed = 0.5
	
	pass

func _process(delta):
	if canSpin:
		spin()
	else:
		d = 0
		speed = 20
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		randomize()
		turns = randi()%1086+366
		canSpin = true
	
	pass
	
func spin():
	print("turns/2:",int(turns/2))
	
	if d <= turns:
		get_parent().get_parent().set("rotation_degrees",d)
		d += speed
	else:
		canSpin = false
		get_tree().change_scene("res://scenes/Tela_pergunta_me.tscn")
	
	print("d:",d)
	print("speed", speed)
	
#	if d >= int(turns/6):
#		speed = 17
#		if d >= int(turns/3):
#			speed =15
#			if d >= int(turns/2):
#				speed =12
#				if d >= int(2*turns/3):
#					speed =7
#					if d >= int(5*turns/6):
#						speed =4
		
		
	pass