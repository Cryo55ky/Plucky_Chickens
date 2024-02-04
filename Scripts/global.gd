extends Node


var max_lives = 3
var lives = max_lives
var hud
var level_completed = 0
var game_completed = false

func lose_life():
	lives -= 1
	hud.load_hearts()
	if lives <= 0:
		level_completed = 0
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		
		
func gain_life():
	lives += 1
	hud.load_hearts()
