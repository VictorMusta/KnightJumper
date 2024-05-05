extends Area2D


@onready var timer = $Timer
@onready var slime = $".."

func _on_body_entered(body):
	print("You died.")
	timer.start()
	Engine.time_scale = 0.5;
	body.get_node("PlayerShape").queue_free()



func _on_timer_timeout():
	Engine.time_scale = 1;
	get_tree().reload_current_scene()
