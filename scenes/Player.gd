extends CharacterBody2D

@export var walk_speed = 300
@export var dash_speed = 600
@export var dash_duration = 0.25
@export var gravity = 400.0
@export var jump_speed = -300
@export var cruch_walk_speed = 150
var can_double_jump = false

const DOUBLETAP_DELAY = 0.2
var last_tap_time = 0.0
var last_direction = ""

var is_dashing = false
var dash_timer = 0.0

var is_crouching = false

#@onready var ap = AnimationPlayer
#@onready var sprite = Sprite2D

func _physics_process(delta):
	velocity.y += delta * gravity
	
	#var direction = Input.get_axis("ui_left", "ui_right")

	# timer dash
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			is_dashing = false  # Stop dash
			velocity.x = 0  

	# Double Jump Mechanic
	# Second Jump
	if can_double_jump and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		can_double_jump = false
	# First Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		can_double_jump = true
		
	# Moving down mechanic
	# moving down faster if down arrow is being pressed while on air
	if not is_on_floor() and Input.is_action_pressed("ui_down"):
		velocity.y = walk_speed
		
	# Crouch 
	#if is_on_floor():
		#if Input.is_action_pressed("ui_down"):
			#print("tes")
			#$AnimationPlayer.play("crouch_idle")
		#if Input.is_action_just_released("ui_down"):
			#$AnimationPlayer.play("crouch_walk")
					
		
	# moving left and right
	if not is_dashing:
		if Input.is_action_pressed("ui_left"):
			
			$Sprite2D.flip_h = true
			if is_on_floor() and Input.is_action_pressed("ui_down"):
				velocity.x = -cruch_walk_speed
				$AnimationPlayer.play("crouch_walk")
			else:
				velocity.x = -walk_speed
				$AnimationPlayer.play("walk")
		elif Input.is_action_pressed("ui_right"):
			
			$Sprite2D.flip_h = false
			if is_on_floor() and Input.is_action_pressed("ui_down"):
				velocity.x = cruch_walk_speed
				$AnimationPlayer.play("crouch_walk")
			else:
				velocity.x = walk_speed
				$AnimationPlayer.play("walk")
		else:
			velocity.x = 0
			if is_on_floor() and Input.is_action_pressed("ui_down"):
				print("tes")
				$AnimationPlayer.play("crouch_idle")
			else:
				$AnimationPlayer.play("idle")

	move_and_slide()

func _input(event):
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		#direction variable to save what inputeventkey just pressed, and also if the pressed key is left/right arrow
		var direction = ""
		if event.keycode == KEY_LEFT:
			direction = "left"
		elif event.keycode == KEY_RIGHT:
			direction = "right"
		
		if direction != "":
			var now = Time.get_ticks_msec() / 1000.0  
			if direction == last_direction and (now - last_tap_time) < DOUBLETAP_DELAY:
				is_dashing = true
				dash_timer = dash_duration
				if direction == "left":
					velocity.x = -dash_speed
				else:
					velocity.x = dash_speed
			last_tap_time = now
			last_direction = direction
