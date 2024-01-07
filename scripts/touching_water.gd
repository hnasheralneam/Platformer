extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.type == "player":
		body.in_water = true
		body.kill_player()
	
func _on_body_exited(body):
	if body.type == "player":
		body.in_water = false
	elif body.type == "fireball":
		body.queue_free()
