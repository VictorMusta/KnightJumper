extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body):
	print("+1 coin!")
	game_manager.add_score()
	animation_player.play("PickupAnimation")
	
