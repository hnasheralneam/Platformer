extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var FIREBALL_COOLDOWN = 500
var last_fireball_shot = Time.get_ticks_msec()
var in_water: bool = false
var type: String = "player"

	
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var Fireball = preload("res://scenes/Fireball.tscn")

func _physics_process(delta):
	if in_water:
		velocity.y = 0
		return

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_text_backspace"):
		shoot()
		



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			velocity.x = direction * SPEED
		else:
			velocity.x = direction * SPEED * .6

		if (direction < 0):
			PlayerDirection.turn_left()
			$Sprite2D.flip_h = true
		else:
			PlayerDirection.turn_right()
			$Sprite2D.flip_h = false

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func shoot():
	print(Time.get_ticks_msec())
	print(last_fireball_shot + FIREBALL_COOLDOWN)
	if (Time.get_ticks_msec() > last_fireball_shot + FIREBALL_COOLDOWN):
		var b = Fireball.instantiate()
		owner.add_child(b)
		b.set_global_position($Marker2D.get_global_position())
		last_fireball_shot = Time.get_ticks_msec()
