extends StaticBody2D
#Preload the player
var rocket = preload("res://src/scenes/Rocket.tscn").instance()
#Create a global variable for the future player
var rocketInt = 0
# The surface of the earth is a SegmentShape2D.
var surface = SegmentShape2D.new()

# Initial speed.
var current_speed = Vector2(0.0, 0.0)

# Ball's acceleration.
var acceleration = 1.5

# Ball's speed.
var player_speed = 200

func _ready():
	# Viewport width.
	var width = get_viewport().get_rect().size.width # px
	# Viewport height.
	var height = get_viewport().get_rect().size.height # px
	# Move the Earth to the bottom of viewport.
	set_pos(Vector2(0.0, height)) # px
	# Rotate the Earth 90 deg.
	set_rotd(90.0)
	# Set the Earth's surface the width of the viewport.
	surface.set_b(Vector2(0.0, width)) # px
	# Add the surface of the Earth.
	add_shape(surface)
	# Add the rocket
	add_child(rocket)
	# set the variable so future calls are neater
	rocketInt = get_node(rocket.get_path())
	# Rotate the fucking thing I don't know lol.
	rocketInt.set_rotd(-90.0)
	# Set the ball on the surface in the middle of the viewport.
	rocketInt.set_pos(Vector2(100.0, width / 2))
	#
	set_process(true)

func move(speed, acc, delta):
	current_speed.x = lerp(current_speed.x, speed, acc * delta)
	rocketInt.set_linear_velocity(Vector2(current_speed.x, rocketInt.get_linear_velocity().y))

func fly(speed, acc, delta):
	current_speed.y = lerp(current_speed.y, speed, acc * delta)
	rocketInt.set_linear_velocity(Vector2(rocketInt.get_linear_velocity().x, current_speed.y))

func _process(delta):
	if (Input.is_key_pressed(KEY_W)):
		fly(-player_speed, acceleration, delta)
		rocketInt.get_node("Exhaust").set_hidden(false)
		print(rocketInt.get_linear_velocity())
	else:
		rocketInt.get_node("Exhaust").set_hidden(true)
	if (Input.is_key_pressed(KEY_A)):
		move(-player_speed, acceleration, delta)
		print(rocketInt.get_linear_velocity())
	if (Input.is_key_pressed(KEY_D)):
		move(player_speed, acceleration, delta)
		print(rocketInt.get_linear_velocity())
