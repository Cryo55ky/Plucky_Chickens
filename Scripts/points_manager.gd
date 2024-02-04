extends Node

@onready var points_label = %PointsLabel


var points = 0

func add_point():
	points += 1
	points_label.text = str(points)
	
	# for every 5 points added to the score (multiples of 5), 
	# the player will earn an extra life. But will not
	# earn the extra life if their current lives is at maximum.
	if points % 5 == 0 and Global.lives < Global.max_lives:
		Global.gain_life()
