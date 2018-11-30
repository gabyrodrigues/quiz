extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	
	get_node("/root/global").wait(get_node("botoes"))
	
	get_node("roleta").set("texture",load("res://TELAS/avatares/tela_avatar"+String(get_node("/root/global").avatar)+".png"))
	
	if get_node("/root/global").presentDay != get_node("/root/global").weekDay:
		get_node("presente").set("texture",load("res://TELAS/Icones/presente.png"))
		get_node("botoes/presente").set("visible",true)
	else:
		get_node("presente").set("texture",load("res://TELAS/Icones/presente_aberto.png"))
		get_node("botoes/presente").set("visible",false)
	pass

func _process(delta):
	get_node("points").set("text",String(get_node("/root/global").points))
	get_node("lifes").set("text","x"+String(get_node("/root/global").lifes))
	get_node("jumps").set("text","x"+String(get_node("/root/global").jumps))
	pass
