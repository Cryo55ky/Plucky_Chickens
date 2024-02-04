extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var animated_sprite_2d = $AnimatedSprite2D
# the ":" symbol means it's a static variable (i.e. 'hurt' cannot be changed into a different type,
# it's always an integer)
var hurt := 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(deltaTime):
	# Handle animations
	# TODO: Implement a way to handle multiple animations 
	# from different characters (e.g. have an idle animation for 4 characters)
	if velocity.x > 0 or velocity.x < 0:
		animated_sprite_2d.animation = "run"
	else:
		animated_sprite_2d.animation = "idle"
		
	# Handle footstep particle emission
	if is_on_floor() and velocity.x > 0 or velocity.x < 0:
		$FootstepParticles.set_emitting(true)
	else:
		$FootstepParticles.set_emitting(false)
	
	
	# Add the gravity and handle the fall animation
	if not is_on_floor():
		velocity.y += gravity * deltaTime
		animated_sprite_2d.animation = "fall"
	
	# Handle jump animation
	if velocity.y < 0:
		animated_sprite_2d.animation = "jump"
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$SoundJump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)

	move_and_slide()
	
	
	var lastDirection = velocity.x
	# Flip the sprite horizontally if moving in the negative x velocity
	if lastDirection < 0:
		animated_sprite_2d.flip_h = lastDirection
	# Else, revert back to non-flipped sprite if the last direction is positive x velocity
	elif lastDirection > 0:
		animated_sprite_2d.flip_h = 0
		
func ouch(enemyPosX):
	Global.lose_life()
	
	velocity.y = JUMP_VELOCITY * 0.5
	
	if position.x < enemyPosX:
		velocity.x = -800
	elif position.x > enemyPosX:
		velocity.x = 800
		
	Input.action_release("left")
	Input.action_release("right")
	
	set_modulate(Color(10, 10, 10, 0.9))
	set_collision_layer(false)
	hurt = 15
	$SoundHurt.play()
	$Timer.start()

func _on_timer_timeout():
	hurt -= 1
	
	if hurt == 0:
		$Timer.stop()
		set_modulate(Color(1, 1, 1, 1))
		set_collision_layer(true)
	else:
		set_modulate(Color(10, 10, 10, 0.9) if hurt % 2 == 0 else Color(1, 0.3, 0.3, 0.7))
