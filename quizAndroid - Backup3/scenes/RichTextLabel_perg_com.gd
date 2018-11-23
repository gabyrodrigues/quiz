extends RichTextLabel

class ComSet:
	var question
	var answer1 = "[center]"
	var answer2 = "[center]"
	var answer3 = "[center]"
	var answer4 = "[center]"
	var rightOption = 0
	func _init(q,a1,a2,a3,a4,ro):
		self.question = q
		
		self.answer1 += a1
		self.answer1 += "[/center]"
		
		self.answer2 += a2
		self.answer2 += "[/center]"
		
		self.answer3 += a3
		self.answer3 += "[/center]"
		
		self.answer4 += a4
		self.answer4 += "[/center]"
		
		self.rightOption = int(ro)

#////////////////////////// END OF CLASS //////////////////////////

#question variables----------------------
var qFile = File.new() 
var qLineCounter = 0
var questions = PoolStringArray()
var qLen = 0
var qIndex = 0

#answers variables----------------------
var a1File = File.new()
var a1LineCounter = 0
var answers1 = PoolStringArray()

var a2File = File.new()
var a2LineCounter = 0
var answers2 = PoolStringArray()

var a3File = File.new()
var a3LineCounter = 0
var answers3 = PoolStringArray()

var a4File = File.new()
var a4LineCounter = 0
var answers4 = PoolStringArray()

#index of right answer variables----------------------
var rFile = File.new()
var rLineCounter = 0
var rightAns = PoolStringArray()

#Comset variables----------------------
var comSet = []

#other variables----------------------
var currentAnswer = 0

func _ready():
	get_node("/root/global").wait(get_parent().get_node("botoes"))

	print("ra: ", get_node("/root/global").ra)
	get_node("/root/global").currentScene = "Tela_pergunta_com.tscn"
	get_parent().get_node("certo").set("visible",false)
	get_parent().get_node("errado").set("visible",false)
	
#processing of questions
	qFile.open("res://perguntas e respostas/com/perguntas com.txt",qFile.READ)
	for i in range(qFile.get_len() - 1):
		questions.insert(qLineCounter,qFile.get_line())
		qLineCounter+=1
		
	for i in range(questions.size()):
		if "?" in questions[i]:
			qLen += 1

#processing of answers
	a1File.open("res://perguntas e respostas/com/respostas1.txt",a1File.READ)
	for i in range(a1File.get_len() - 1):
		answers1.insert(a1LineCounter,a1File.get_line())
		a1LineCounter+=1
		
	a2File.open("res://perguntas e respostas/com/respostas2.txt",a2File.READ)
	for i in range(a2File.get_len() - 1):
		answers2.insert(a2LineCounter,a2File.get_line())
		a2LineCounter+=1
	
	a3File.open("res://perguntas e respostas/com/respostas3.txt",a3File.READ)
	for i in range(a3File.get_len() - 1):
		answers3.insert(a3LineCounter,a3File.get_line())
		a3LineCounter+=1
	
	a4File.open("res://perguntas e respostas/com/respostas4.txt",a4File.READ)
	for i in range(a4File.get_len() - 1):
		answers4.insert(a4LineCounter,a4File.get_line())
		a4LineCounter+=1

#processing of index of right answers
	rFile.open("res://perguntas e respostas/com/indicesRespostas.txt",qFile.READ)
	for i in range(rFile.get_len() - 1):
		rightAns.insert(rLineCounter,rFile.get_line())
		rLineCounter+=1
	
#processing of Com sets
	for i in range(qLen):
		comSet.append(ComSet.new(questions[i],answers1[i],answers2[i],answers3[i],answers4[i],rightAns[i]))

#////////////////////////// END OF PROCESSING //////////////////////////	
		
	print("len: ", qLen)
	randomize()
	qIndex = randi()%qLen+0
	print("qIndex:",qIndex)
	
	print("quest: ",comSet[qIndex].question)
	print("a1: ",comSet[qIndex].answer1)
	print("a2: ",comSet[qIndex].answer2)
	print("a3: ",comSet[qIndex].answer3)
	print("a4: ",comSet[qIndex].answer4)
	print("ro: ",comSet[qIndex].rightOption)
	
	
	
	pass
	

func _process(delta):
	set("text",comSet[qIndex].question)
	get_parent().get_node("text_resposta1").append_bbcode(comSet[qIndex].answer1)
	get_parent().get_node("text_resposta2").append_bbcode(comSet[qIndex].answer2)
	get_parent().get_node("text_resposta3").append_bbcode(comSet[qIndex].answer3)
	get_parent().get_node("text_resposta4").append_bbcode(comSet[qIndex].answer4)
	
	get_parent().get_node("timerText").set("text","00:"+String(int(get_parent().get_node("Timer").get("time_left"))))
	get_parent().get_node("lifesText").set("text",String(get_node("/root/global").lifes))
	get_parent().get_node("jumpsText").set("text",String(get_node("/root/global").jumps))
	
	if get_parent().get_node("Timer").get("time_left") == 0:
		get_node("/root/global").lifes -= 1
		get_tree().change_scene("res://scenes/Tela_roleta.tscn")
	
	#get_parent().get_node("hi").set("text", "HELLO")
		
	pass

func checkAnswer():
	if currentAnswer == int(comSet[qIndex].rightOption):

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
	get_parent().get_node("botao3").set("visible",true)
	get_parent().get_node("botao4").set("visible",true)
		
	randomize()
	qIndex = randi()%qLen+0
	
	pass