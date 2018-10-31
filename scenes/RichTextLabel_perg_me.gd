extends RichTextLabel

class MeSet:
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

#MEset variables----------------------
var meSet = []

#other variables----------------------
var currentAnswer = 0

func _ready():

	print("ra: ", get_node("/root/global").ra)
	
#processing of questions
	qFile.open("res://perguntas e respostas/me/perguntas me.txt",qFile.READ)
	for i in range(qFile.get_len() - 1):
		questions.insert(qLineCounter,qFile.get_line())
		qLineCounter+=1
		
	for i in range(questions.size()):
		if "?" in questions[i]:
			qLen += 1

#processing of answers
	a1File.open("res://perguntas e respostas/me/respostas1.txt",a1File.READ)
	for i in range(a1File.get_len() - 1):
		answers1.insert(a1LineCounter,a1File.get_line())
		a1LineCounter+=1
		
	a2File.open("res://perguntas e respostas/me/respostas2.txt",a2File.READ)
	for i in range(a2File.get_len() - 1):
		answers2.insert(a2LineCounter,a2File.get_line())
		a2LineCounter+=1
	
	a3File.open("res://perguntas e respostas/me/respostas3.txt",a3File.READ)
	for i in range(a3File.get_len() - 1):
		answers3.insert(a3LineCounter,a3File.get_line())
		a3LineCounter+=1
	
	a4File.open("res://perguntas e respostas/me/respostas4.txt",a4File.READ)
	for i in range(a4File.get_len() - 1):
		answers4.insert(a4LineCounter,a4File.get_line())
		a4LineCounter+=1

#processing of index of right answers
	rFile.open("res://perguntas e respostas/me/indicesRespostas.txt",qFile.READ)
	for i in range(rFile.get_len() - 1):
		rightAns.insert(rLineCounter,rFile.get_line())
		rLineCounter+=1
	
#processing of ME sets
	for i in range(qLen):
		meSet.append(MeSet.new(questions[i],answers1[i],answers2[i],answers3[i],answers4[i],rightAns[i]))

#////////////////////////// END OF PROCESSING //////////////////////////	
		
	print("len: ", qLen)
	randomize()
	qIndex = randi()%qLen+0
	print("qIndex:",qIndex)
	
	print("quest: ",meSet[qIndex].question)
	print("a1: ",meSet[qIndex].answer1)
	print("a2: ",meSet[qIndex].answer2)
	print("a3: ",meSet[qIndex].answer3)
	print("a4: ",meSet[qIndex].answer4)
	print("ro: ",meSet[qIndex].rightOption)
	
	
	
	pass
	

func _process(delta):
	set("text",meSet[qIndex].question)
	get_parent().get_node("text_resposta1").append_bbcode(meSet[qIndex].answer1)
	get_parent().get_node("text_resposta2").append_bbcode(meSet[qIndex].answer2)
	get_parent().get_node("text_resposta3").append_bbcode(meSet[qIndex].answer3)
	get_parent().get_node("text_resposta4").append_bbcode(meSet[qIndex].answer4)
	
	get_parent().get_node("timerText").set("text","00:"+String(int(get_parent().get_node("Timer").get("time_left"))))
	
		
	pass

func checkAnswer():
	if currentAnswer == int(meSet[qIndex].rightOption):

		get_node("/root/global").ra += 1
		
		get_parent().get_node("Timer").set("paused",true)
		get_parent().get_node("darkbg").set("visible",true)
		get_parent().get_node("acertou").set("visible",true)
		
		get_parent().get_node("botao1").set("visible",false)
		get_parent().get_node("botao2").set("visible",false)
		get_parent().get_node("botao3").set("visible",false)
		get_parent().get_node("botao4").set("visible",false)
		
		get_parent().get_node("proximo").set("visible",true)
		
	else:
		get_parent().get_node("Timer").set("paused",true)
		get_parent().get_node("darkbg").set("visible",true)
		get_parent().get_node("errou").set("visible",true)
		
		get_parent().get_node("botao1").set("visible",false)
		get_parent().get_node("botao2").set("visible",false)
		get_parent().get_node("botao3").set("visible",false)
		get_parent().get_node("botao4").set("visible",false)

		get_parent().get_node("aprender").set("visible",true)
		
	pass
	
func reiniciate():
	get_parent().get_node("botao1").set("visible",true)
	get_parent().get_node("botao2").set("visible",true)
	get_parent().get_node("botao3").set("visible",true)
	get_parent().get_node("botao4").set("visible",true)
		
	randomize()
	qIndex = randi()%qLen+0
	
	pass