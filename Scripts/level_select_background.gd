extends ParallaxBackground


func _process(deltaTime):
	scroll_base_offset -= Vector2(25, -75) * deltaTime
