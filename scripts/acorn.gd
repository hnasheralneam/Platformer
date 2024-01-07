extends Sprite2D

var bobbing_speed = 2
var bobbing_amplitude = 5

var rand_start = randf() * 10000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y = sin(Time.get_unix_time_from_system() + rand_start
 * bobbing_speed) * bobbing_amplitude


