extends Node2D

# class member variables go here, for example:
# var a = 2
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
	if Input.is_action_just_pressed("Mouse left"):
		print("hey")
		randomize()
		turns = randi()%1086+366
		canSpin = true
		
	if canSpin:
		spin()
	else:
		d = 0
		speed = 20
			
	pass
	
func spin():
	print("turns/2:",int(turns/2))
	
	if d <= turns:
		set("rotation_degrees",d)
		d += speed
	else:
		canSpin = false
	
	print("d:",d)
	print("speed", speed)
	
	if d >= int(turns/6):
		speed = 17
		if d >= int(turns/3):
			speed =15
			if d >= int(turns/2):
				speed =12
				if d >= int(2*turns/3):
					speed =7
					if d >= int(5*turns/6):
						speed =4
		
		
	pass
	

