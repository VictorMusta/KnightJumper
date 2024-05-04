class_name HitBox
extends Area2D

var damage = 10

func _init():
	collision_layer=2
	collision_mask=0


func _on_body_entered(body):
	print("You killed someone!")

