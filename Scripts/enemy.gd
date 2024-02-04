extends CharacterBody2D

@export var speed = 100
@export var direction = -1
@export var detects_cliffs = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	$FloorChecker.position.x = $CollisionShape2D.shape.get_size().x * direction
	$FloorChecker.enabled = detects_cliffs


func _physics_process(deltaTime):
	if is_on_wall() or not $FloorChecker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		$FloorChecker.position.x = $CollisionShape2D.shape.get_size().x * direction
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * deltaTime
		
	velocity.x = speed * direction

	move_and_slide()


func _on_top_checker_body_entered(body):
	#$AnimationPlayer.play("hit")
	#$AnimatedSprite2D.set_visible(false)
	#$VanishEffect.set_visible(true)
	#speed = 0
	#set_collision_layer_value(4, false)
	#set_collision_mask_value(0, false)
	#$TopChecker.set_collision_layer_value(4, false)
	#$TopChecker.set_collision_mask_value(0, false)
	#$SideChecker.set_collision_layer_value(4, false)
	#$SideChecker.set_collision_mask_value(0, false)
	pass


func _on_side_checker_body_entered(body):
	body.ouch(position.x)


func _on_animation_player_animation_finished(anim_name):
	queue_free()
