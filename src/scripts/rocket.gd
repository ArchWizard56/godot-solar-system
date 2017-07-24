extends RigidBody2D
#Define other nodes
onready var exhaust = get_node("Exhaust")
#variables to control speed
export var rotSpeed = .1
export var accel = 20
var acc = Vector2(0, accel)
#Placeholder variables
var rot = 0
func _ready():
	set_fixed_process(true)
func rotate():
	if Input.is_action_pressed("rotLeft"):
		rot = get_rot() + rotSpeed 
	if Input.is_action_pressed("rotRight"):
		rot = get_rot() - rotSpeed
	if Input.is_action_pressed("rotThrust"):
		exhaust.set_hidden(false)
		apply_impulse(exhaust.get_pos(), acc.rotated(rot + PI))
	else:
		exhaust.set_hidden(true)
		
func _fixed_process(delta):
	rotate()
	set_rot(rot)
	