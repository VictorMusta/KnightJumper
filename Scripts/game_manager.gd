extends Node

var score = 0;
@onready var score_label = $"../Labels/ScoreLabel";
	
func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit() # default behavior
	
func add_score():
	score +=1
	score_label.text = "You currently have " + str(score) + "/12 coins (noob!)"
	if(score == 12):
		score_label.text = "You finished the game! \n Well done!\n Please rest now..."
