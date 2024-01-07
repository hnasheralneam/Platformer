extends RigidBody2D

var velocity = Vector2(200, 300)
var type = "fireball"

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		velocity.x *= 0.95
		velocity.y *= 0.95
	if (abs(velocity.y) < 50):
		queue_free()
