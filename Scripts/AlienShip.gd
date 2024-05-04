extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var alien_ship = $"."

var life = 15;
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("FlyingPattern")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_(delta):
	pass

func take_damage(damage:int):
	print("i took damage!")
	life -= damage
	if(life <=0):
		alien_ship.queue_free()
	animation_player.play("take_damage")
