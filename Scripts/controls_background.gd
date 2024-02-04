extends ParallaxBackground


func _process(deltaTime):
	scroll_base_offset -= Vector2(25, -75) * deltaTime


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
