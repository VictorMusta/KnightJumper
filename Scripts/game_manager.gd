extends Node

var score = 0;
@onready var score_label = $"../Labels/ScoreLabel"

func add_score():
	score +=1
	score_label.text = "You currently have " + str(score) + " coins!"