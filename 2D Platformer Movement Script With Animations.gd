extends KinematicBody2D

const ACCELERATION = 20
const MAX_SPEED = 100
const GRAVITY = 10
const JUMP_FORCE = -500

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY
	var friction = false

	if Input.is_action_pressed("ui_right"):
		velocity.x = min(velocity.x + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = max(velocity.x - ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Idle")
		velocity.x = lerp(velocity.x, 0, 0.2)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE
		velocity.x = lerp(velocity.x, 0, 0.05)
		
	if not is_on_floor():
		$AnimatedSprite.play("Jump")
		if velocity.y > 0:
			$AnimatedSprite.play("Fall")

	velocity = move_and_slide(velocity, Vector2.UP)