extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var sword = $Sword
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_timer = $JumpTimer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_jump = false

func _process(delta):
	if Input.is_action_just_pressed("Attack"):
		sword.SwingForward()
		
func _jump():
	velocity.y = JUMP_VELOCITY
	can_jump = false
	
func _physics_process(delta):
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and can_jump:
		_jump()
	if Input.is_action_pressed("jump"):
		can_jump = false

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move left", "move right")
	
	# flip the sprite
	if(direction > 0) :
		animated_sprite.flip_h = false
		if(sword.scale.x>0):
			sword.scale.x = -sword.scale.x
	if(direction < 0) :
		animated_sprite.flip_h = true
		if(sword.scale.x<0):
			sword.scale.x = -sword.scale.x
		
		
	# plays animations based on touching floor or not.
	if is_on_floor():
		jump_timer.stop()
		if(can_jump == false):
			can_jump=true
		if(direction == 0) :
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")		
		if(jump_timer.is_stopped()):
			jump_timer.start()
	# Add the gravity.		
		velocity.y += gravity * delta
		
	# change velocity based on direction
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
func _on_jump_timer_timeout():
	if(can_jump == true):
		print("can't jump")
	can_jump = false	
		
