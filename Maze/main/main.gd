extends Node2D
#quando apertar o botão irá para cena principal
func _on_Button_pressed():
	get_tree().change_scene("res://maze/maze.tscn")
