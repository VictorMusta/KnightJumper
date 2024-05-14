extends Node

var score = 0;
@onready var score_label = $"../Labels/ScoreLabel"

func add_score():
	score +=1
	score_label.text = "You currently have " + str(score) + "/12 coins (noob!)"
	if(score == 12):
		score_label.text = "You finished the game! \n Well done!\n Please rest now..."
