extends Area2D

@export var target_level : PackedScene

func _on_body_entered(body):
	if body.name == "Player":
		Global.lives = Global.max_lives
		Global.level_completed += 1
		print(Global.level_completed)
		
		if Global.level_completed == 6:
			get_tree().change_scene_to_file("res://Scenes/win.tscn")
		else:
			get_tree().change_scene_to_packed(target_level)
		
	
