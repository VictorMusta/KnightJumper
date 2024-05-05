extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var alien_ship = $"."
@onready var hit_timer = $HitTimer

var life = 15;
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("FlyingPattern")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_(delta):
	pass

func take_damage(damage:int):
	display_damage_animation_once()	
	print("i took damage!")
	life -= damage
	if(life <=0):
		alien_ship.queue_free()

func display_damage_animation_once():
	animation_player.play("take_damage")	
	hit_timer.start()

func _on_hit_timer_timeout():
	print("please continue walking")
	animation_player.play("FlyingPattern")	
