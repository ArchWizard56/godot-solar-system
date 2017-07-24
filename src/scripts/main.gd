extends Node
#Declare nodes
onready var bg = get_node("ParallaxBackground/ParallaxLayer/Sprite")
onready var cam = get_node("RigidBody2D/Camera2D")
#Simple vector2
var vec1 = Vector2(.1,.1)
func _ready():
	set_fixed_process(true)
func _fixed_process(delta):
	if Input.is_action_pressed("zoomOut"):
		cam.set_zoom(cam.get_zoom() + vec1)
		bg.set_scale(bg.get_scale() + vec1)
	if Input.is_action_pressed("zoomIn"):
		cam.set_zoom(cam.get_zoom() - vec1)
		bg.set_scale(bg.get_scale() - vec1)