extends Node2D
#quando apertar o botão irá voltar ao menu
func _on_Button_pressed():
	get_tree().change_scene("res://main/main.tscn")
