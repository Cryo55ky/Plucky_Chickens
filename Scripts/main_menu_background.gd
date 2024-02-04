extends ParallaxBackground


func _process(deltaTime):
	scroll_base_offset -= Vector2(0, -75) * deltaTime
