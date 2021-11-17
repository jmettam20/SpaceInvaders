extends KinematicBody2D

var speed = 100

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta,0))
	elif Input.is_action_just_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta,0))
		
		
