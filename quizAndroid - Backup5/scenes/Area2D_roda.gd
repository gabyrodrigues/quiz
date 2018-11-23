extends Area2D

var canSpin
var d
var turns
var speed
var downSpeed

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
		get_parent().get_parent().set("rotation_degrees",0)
	pass

func _input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.is_pressed():
		randomize()
		turns = randi()%1086+366
		
		canSpin = true

	pass

func spin():
	print("turns:",turns)

	if d <= turns:
		get_parent().get_parent().set("rotation_degrees",d)
		d += speed
	else:
		canSpin = false
		mudarTela()
#		get_tree().change_scene("res://scenes/Tela_pergunta_me.tscn")

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
	
func mudarTela():
	var v1 = d/360.0
	var v2 = v1 - int(v1)
	var v3 = 360*v2
	var v4 = v3/33
	print("D:",d)
	print("V1:",v1)
	print("V2:",v2)
	print("V3:",v3)
	print("V4:",v4)
	
	if((v4 > 0 and v4<=1) or (v4 > 4 and v4<=5)):
		print("V/F!")
		get_tree().change_scene("res://scenes/Tela_pergunta_vf.tscn")
	elif((v4 > 1 and v4<=2) or (v4 > 6 and v4<=7) or (v4 > 9 and v4<=10)):
		print("multipla escolha!")
		get_tree().change_scene("res://scenes/Tela_pergunta_me.tscn")
	elif((v4 > 2 and v4<=3) or (v4 > 5 and v4<=6) or (v4 > 8 and v4<=9)):
		print("coringa!")
		get_tree().get_nodes_in_group("roda")[0].set("visible",false)
		get_tree().get_nodes_in_group("coringa")[0].set("visible",true)
	elif((v4 > 3 and v4<=4) or (v4 > 7 and v4<=8) or (v4 > 10)):
		print("complete!")
		get_tree().change_scene("res://scenes/Tela_pergunta_com.tscn")	
	pass