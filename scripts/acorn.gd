extends Sprite2D

var bobbing_speed = 10.0
var bobbing_amplitude = 50.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = sin(get_process_delta_time() * bobbing_speed) * bobbing_amplitude


