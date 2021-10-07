extends KinematicBody2D

const SPEED = 100
const GRAVITY = 10
const JUMP_FORCE = -500

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)