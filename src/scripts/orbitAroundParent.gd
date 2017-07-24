extends Node
#Placeholder variables
var rad = 0
var times = 1
var newPos = Vector2()
var b = 0
var a = 0
var pos = 0
var angle = 0
#Declare nodes
onready var par = get_parent()
func _ready():
	pos = par.get_pos()
	#calculate the distance to the parent
	b = pos.y 
	a = pos.x
	rad = pow(a, 2) + pow(b, 2)
	rad = sqrt(rad)
	angle = atan(b/a)
	#set fixed process
	set_fixed_process(true)
func _fixed_process(delta):
	#make this function run once every second
	times += 1
	if times > 1:
		pos = par.get_pos()
		times = 1
		angle += 0.0017453 
		newPos.x = rad * cos(angle)
		newPos.y = rad * sin(angle)
	print(par.get_pos())
	print(get_node("../..").get_pos())
	par.set_pos(newPos)