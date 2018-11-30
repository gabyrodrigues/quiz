extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ra = 0
var points = 0
var lifes = 0
var jumps = 0
var winPoints = 25
var bonus = 1.0
var winStreak = 0.0
var loseStreak = 0
var wait = false
var node
var currentScene
var sounds = true
const ARQUIVO = "user://save.data"

var time = OS.get_datetime()
var weekDay = time["weekday"]
var presentDay

var avatar = 1

func _ready():

	if sounds == true:
		get_node("/root/music").set("playing",true)
	else:
		get_node("/root/music").set("playing",false)
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
	
	if loseStreak == 3:
		points -= 25
		loseStreak = 0
	
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
	
func saveData():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	var dados = {"points" : points, "lifes" : lifes, "jumps" : jumps, "presentDay" : presentDay, "avatar": avatar}
	
	if not erro:
		arquivo.store_var(dados)
		
	else:
		print("Erro ao salvar dados")
		
	arquivo.close()
	
func loadData():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	if not erro:
		var dados_salvos = arquivo.get_var()
		points = dados_salvos["points"]
		lifes = dados_salvos["lifes"]
		jumps = dados_salvos["jumps"]
		presentDay = dados_salvos["presentDay"]
		avatar = dados_salvos["avatar"]
	else:
		print("Erro ao carregar dados")
		
	arquivo.close()