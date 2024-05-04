extends Node2D



@onready var slime = $"."
@onready var ray_cast_2d_right = $RayCast2DRight;
@onready var ray_cast_2d_left = $RayCast2DLeft;
@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 60;
var life = 15;
var direction = 1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_left.is_colliding():
		direction = 1;
		animated_sprite.flip_h=false
	if ray_cast_2d_right.is_colliding():
		direction = -1;
		animated_sprite.flip_h=true
	position.x += SPEED * direction * delta
	pass

func take_damage(damage:int):
	print("i took damage!")
	life -= damage
	if(life <=0):
		slime.queue_free()
	animated_sprite.play("take_damage")
