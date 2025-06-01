extends Node2D

var score := 0
@onready var score_label = $CanvasLayer/ScoreLabel

func _ready():
	update_score()

func increase_score():
	score += 1
	update_score()

func update_score():
	score_label.text = "Score: %d" % score
