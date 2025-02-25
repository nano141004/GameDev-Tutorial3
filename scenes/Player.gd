extends CharacterBody2D

@export var walk_speed = 200
@export var gravity = 400.0
@export var jump_speed = -200
var can_double_jump = false

func _physics_process(delta):
	velocity.y += delta * gravity
	
	# need to know why when i put the 2nd jump handler after the 1st jump handler, it doenst work
	# and when the 2nd jump handler put before the 1st jump handler, it works (just like what i did below now)
	
	#2nd jump
	if can_double_jump == true and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_double_jump = false
	#1st jump
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_double_jump = true
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0
		
	# "move_and_slide" already takes delta time into account.
	move_and_slide()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
