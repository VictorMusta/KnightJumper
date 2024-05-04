extends Node2D
@onready var animation_player = $AnimationPlayer

func SwingForward():
	animation_player.play("SwingForward")
