extends Node

var player_direction: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_direction():
	return player_direction

func turn_left():
	player_direction = -1
	
func turn_right():
	player_direction = -1
