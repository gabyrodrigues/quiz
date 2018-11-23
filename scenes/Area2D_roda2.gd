extends Area2D

var canSpin
var d
var turns
var speed
var downSpeed
var coringa = false

func _ready():
	print("raaa: ", get_node("/root/global").ra)
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
		
		
	if Input.is_action_pressed("spacebar"):
		get_parent().get_parent().get_node("roda2").set("rotation_degrees",0)
	
	if(coringa == true):
		if (get_parent().get_parent().get_node("Timer").get("time_left") == 0):
				get_parent().set("visible",false)
				get_parent().get_parent().get_node("coringa").set("visible",true)
	pass

func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		randomize()
		turns = randi()%1086+726
		
		canSpin = true

	pass

func spin():
	print("turns:",turns)

	if d <= turns:
		get_parent().get_parent().get_node("roda2").set("rotation_degrees",d)
		d += speed
	else:
		canSpin = false
		mudarTela()
#		get_tree().change_scene("res://scenes/Tela_pergunta_me.tscn")

	print("d:",d)
	print("speed", speed)

	if d >= int(turns/12):
		speed = 18
		if d >= int(2*turns/12):
			speed =16
			if d >= int(3*turns/12):
				speed =14
				if d >= int(4*turns/12):
					speed =12
					if d >= int(5*turns/12):
						speed =10
						if d >= int(6*turns/12):
							speed =8
							if d >= int(7*turns/12):
								speed =6
								if d >= int(8*turns/12):
									speed =4
									if d >= int(9*turns/12):
										speed =2
										if d >= int(10*turns/12):
											speed =1
											if d >= int(11*turns/12):
												speed =0.8
	pass
	
func mudarTela():
	var v1 = d/360.0
	var v2 = v1 - int(v1)
	var v3 = 360*v2
	var v4 = v3/51.42
	print("D:",d)
	print("V1:",v1)
	print("V2:",v2)
	print("V3:",v3)
	print("V4:",v4)
	
	if((v4 > 0 and v4<=1) or (v4 > 4 and v4<=5)):
		print("V/F!")
		get_tree().change_scene("res://scenes/Tela_pergunta_vf.tscn")
		
	elif((v4 > 1 and v4<=2) or (v4 > 5 and v4<=6)):
		print("complete!")
		get_tree().change_scene("res://scenes/Tela_pergunta_com.tscn")
		
	elif((v4 > 3 and v4<=4) or (v4 > 6)):
		print("multipla escolha!")
		get_tree().change_scene("res://scenes/Tela_pergunta_me.tscn")
		
	elif(v4 > 2 and v4<=3):
		
		print("coringa!")
		get_parent().get_parent().get_node("Timer").start()
		coringa = true
		get_parent().get_parent().get_node("botoes").set("visible",false)
		get_parent().get_parent().get_node("menuButton").set("visible",false)
			
	pass