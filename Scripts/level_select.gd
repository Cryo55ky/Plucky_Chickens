extends Node


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_level_1_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_level_2_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")


func _on_level_3_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")


func _on_level_4_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_4.tscn")


func _on_level_5_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_5.tscn")


func _on_level_6_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_6.tscn")
