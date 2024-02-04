extends Node


func _on_back_to_main_menu_button_pressed():
	Global.game_completed = true
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
