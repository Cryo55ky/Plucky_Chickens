extends Area2D

@onready var points_manager = %PointsManager



func _on_body_entered(body):
	if body.name == "Player":
		set_collision_mask_value(0, false)
		$AnimationPlayer.play("vanish")
		$SoundCollectableCollect.play()
		$Orange.set_visible(false)
		$VanishEffect.set_visible(true)
		points_manager.add_point()


func _on_animation_player_animation_finished(anim_name):
	queue_free()
	
