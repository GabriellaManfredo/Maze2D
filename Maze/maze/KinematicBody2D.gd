extends KinematicBody2D

#declaração de variavéis
#carrega o áudio no inicio da cena
onready var som_personagem = $player
#velocidade do deslocamento do player
export (int) var speed= 250
#posicionamento do player no ambiente
var velocity = Vector2()
#controla a contagem dos itens
var contador_coleta = 0
#controla o placar das coletas
var placar = 0

#carregada na execução do jogo
#insere o valor da variável na label
func _ready():
		get_parent().get_node("placar").text = "Pontos: " + str(contador_coleta)

#leitura das movimentações do teclado + o acionamento da música
func get_input():
		velocity = Vector2()
		
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
			if(!som_personagem.playing):
				som_personagem.play()
				
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
			if(!som_personagem.playing):
				som_personagem.play()
		
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
			if(!som_personagem.playing):
				som_personagem.play()
		
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
			if(!som_personagem.playing):
				som_personagem.play()
		
		#para de tocar a música
		if Input.is_action_just_released("ui_right"):
			som_personagem.stop()
		if Input.is_action_just_released("ui_left"):
			som_personagem.stop()
		if Input.is_action_just_released("ui_down"):
			som_personagem.stop()
		if Input.is_action_just_released("ui_up"):
			som_personagem.stop()	
			
		velocity = velocity.normalized() * speed
		return velocity

#processamento da física do ambiente
func _physics_process(delta):
		get_input()
		velocity = move_and_slide(velocity)

#quando o player entrar na area de colisão, o item irá contabilizar a pontuação
#e desabilitar o itemS
func _on_Area2D_body_entered(body):
	
	if "item1" in body.name:
		get_parent().get_node("item1").hide()
		get_parent().get_node("item1/CollisionShape2D").set_deferred("disabled", true)
		contador_coleta += 1
		get_parent().get_node("placar").text = "Pontos: " + str(contador_coleta)
	
	if "item2" in body.name:
		get_parent().get_node("item2").hide()
		get_parent().get_node("item2/colisao2").set_deferred("disabled", true)
			
		contador_coleta += 1
		get_parent().get_node("placar").text = "Pontos: " + str(contador_coleta)

	if "item3" in body.name:
		get_parent().get_node("item3").hide()
		get_parent().get_node("item3/colisao3").set_deferred("disabled", true)
		contador_coleta += 1
		get_parent().get_node("placar").text = "Pontos: " + str (contador_coleta)

	if "item4" in body.name:
		get_parent().get_node("item4").hide()
		get_parent().get_node("item4/colisao4").set_deferred("disabled", true)
		contador_coleta += 1
		get_parent().get_node("placar").text = "Pontos: " + str (contador_coleta)

	if "item5" in body.name:
		get_parent().get_node("item5").hide()
		get_parent().get_node("item5/colisao5").set_deferred("disabled", true)
		contador_coleta += 1 
		get_parent().get_node("placar").text = "Pontos: " + str (contador_coleta)

	if "item6" in body.name: 
		get_parent().get_node("item6").hide()
		get_parent().get_node("item6/colisao6").set_deferred("disabled", true)
		contador_coleta +=1
		get_parent().get_node("placar").text = "Pontos: " + str (contador_coleta)

	if "item7" in body.name:
		get_parent().get_node("item7").hide()
		get_parent().get_node("item7/CollisionShape2D").set_deferred("disabled", true)
		contador_coleta += 1
		get_parent().get_node("placar").text = "Pontos: " + str (contador_coleta)

	if "item9" in body.name:
		get_parent().get_node("item9").hide()
		get_parent().get_node("item9/CollisionShape2D").set_deferred("disabled", true)
		contador_coleta += 1
		get_parent().get_node("placar").text = "Pontos: " + str (contador_coleta)

	#quando o player alcançar a linha de chegada troca de cena
	if "chegada" in body.name:
		get_tree().change_scene("res://gameover/GAMEOVER.tscn")
