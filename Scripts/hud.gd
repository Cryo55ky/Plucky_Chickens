extends CanvasLayer


func _ready():
	load_hearts()
	Global.hud = self
	
	
func load_hearts():
	# multiply the number of lives (3) to the number of pixels a single heart has
	# and assign that to the x component of the texture rect's size
	$HeartsFull.size.x = Global.lives * 53
	# subtract the number of current lives (e.g. 2) and subtract that from the maximum
	# number of lives (3) and finally, multiply all that by the number of pixels
	# of a single heart 
	$HeartsEmpty.size.x = (Global.max_lives - Global.lives) * 53
	# take the position of HeartsFull and subtract the size of HeartsFull
	$HeartsEmpty.position.x = $HeartsFull.position.x + $HeartsFull.size.x * $HeartsFull.scale.x
