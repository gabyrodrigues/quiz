extends Button

var contador = 0
const ARQUIVO = "user://save.data"

func _ready():
	carregar_dados()
	text = str(contador)
	pass


func _on_Button_pressed():
	contador = contador + 1
	salvar_dados()
	text = str(contador)
	pass # replace with function body
	
	
func salvar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	var dados = {"contador" : contador}
	
	if not erro:
		arquivo.store_var(dados)
	else:
		print("Erro ao salvar dados")
		
	arquivo.close()
	
func carregar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	if not erro:
		var dados_salvos = arquivo.get_var()
		contador = dados_salvos["contador"]
	else:
		print("Erro ao carregar dados")
		
	arquivo.close()
	
