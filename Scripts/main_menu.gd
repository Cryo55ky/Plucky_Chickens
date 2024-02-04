extends Node


func _on_play_button_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_level_select_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")


func _on_character_select_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/character_select.tscn")


func _on_how_to_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/how_to_play.tscn")
