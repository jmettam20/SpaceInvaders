##extends KinematicBody2D

#export var speed = 200

#func _ready():
	#set_physics_process(true)
	
#func _physics_process(delta):
	#move_and_collide(Vector2(speed * delta, 0))

extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 0

var SPEED = 100

var multiplier = false 

var motion = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = left

var down = 10
var moveLimit = 10



func _physics_process(_delta):
	
	motion.x = direction.x * SPEED
	motion = move_and_slide(motion, UP)

	if is_on_wall():
	
		position.y = position.y + 50
		
		
		multiplier = true 
		
		if direction == left:
			direction = right  
			
			
		elif direction == right:
			direction = left
		
	else:
		multiplier = false
			
	if multiplier == true:
		SPEED = SPEED * 1.25

func _on_GameOver_body_entered(_body):
	get_tree().quit()
