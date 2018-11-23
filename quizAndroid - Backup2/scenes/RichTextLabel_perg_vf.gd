extends RichTextLabel

class VfSet:
	var question
	var rightOption = 0
	
	func _init(q,ro):
		self.question = q
		self.rightOption = int(ro)

#////////////////////////// END OF CLASS //////////////////////////

#question variables----------------------
var qFile = File.new() 
var qLineCounter = 0
var questions = PoolStringArray()
var qLen = 0
var qIndex = 0

#index of right answer variables----------------------
var rFile = File.new()
var rLineCounter = 0
var rightAns = PoolStringArray()

#Vfset variables----------------------
var vfSet = []

#other variables----------------------
var currentAnswer = 0

func _ready():

	print("ra: ", get_node("/root/global").ra)
	get_parent().get_node("certo").set("visible",false)
	get_parent().get_node("errado").set("visible",false)
	
#processing of questions
	qFile.open("res://perguntas e respostas/vf/perguntas vf.txt",qFile.READ)
	for i in range(qFile.get_len() - 1):
		questions.insert(qLineCounter,qFile.get_line())
		qLineCounter+=1
		
	for i in range(questions.size()):
		if "?" in questions[i]:
			qLen += 1

#processing of index of right answers
	rFile.open("res://perguntas e respostas/vf/indicesRespostas.txt",qFile.READ)
	for i in range(rFile.get_len() - 1):
		rightAns.insert(rLineCounter,rFile.get_line())
		rLineCounter+=1
	
#processing of Vf sets
	for i in range(qLen):
		vfSet.append(VfSet.new(questions[i],rightAns[i]))

#////////////////////////// END OF PROCESSING //////////////////////////	
		
	print("len: ", qLen)
	randomize()
	qIndex = randi()%qLen+0
	print("qIndex:",qIndex)
	
	print("quest: ",vfSet[qIndex].question)
	print("ro: ",vfSet[qIndex].rightOption)
	
	
	
	pass
	

func _process(delta):
	set("text",vfSet[qIndex].question)
	
	get_parent().get_node("timerText").set("text","00:"+String(int(get_parent().get_node("Timer").get("time_left"))))
	get_parent().get_node("lifesText").set("text",String(get_node("/root/global").lifes))
	get_parent().get_node("jumpsText").set("text",String(get_node("/root/global").jumps))
	
	#get_parent().get_node("hi").set("text", "HELLO")
	
	if get_parent().get_node("Timer").get("time_left") == 0:
		get_node("/root/global").lifes -= 1
		get_tree().change_scene("res://scenes/Tela_roleta.tscn")
	
	pass

func checkAnswer():
	if currentAnswer == int(vfSet[qIndex].rightOption):

		get_node("/root/global").ra += 1
		get_node("/root/global").winStreak += 1
		get_node("/root/global").loseStreak = 0
		get_node("/root/global").points += get_node("/root/global").winPoints*get_node("/root/global").bonus
		
		get_parent().get_node("Timer").set("paused",true)
		get_parent().get_node("darkbg").set("visible",true)
		get_parent().get_node("certo").set("visible",true)
		get_node("/root/global").wait(get_parent().get_node("certo/acertou/continuar"))
		
		get_parent().get_node("botoes").set("visible",false)
		
		
	else:
		get_node("/root/global").winStreak = 0
		get_node("/root/global").loseStreak += 1
		
		get_parent().get_node("Timer").set("paused",true)
		get_parent().get_node("darkbg").set("visible",true)
		get_parent().get_node("errado").set("visible",true)
		get_node("/root/global").wait(get_parent().get_node("errado/errou/botoes"))
		
		get_parent().get_node("botoes").set("visible",false)
		
		
	pass
	
func reiniciate():
	get_parent().get_node("botao1").set("visible",true)
	get_parent().get_node("botao2").set("visible",true)

	randomize()
	qIndex = randi()%qLen+0
	
	pass