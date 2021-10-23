extends KinematicBody2D

#const upDirection = Vector2.UP

export var speed = 600.0
export var jumpStrength = 1500.0
export var maximumJumps = 2
export var doubleJumpStrength = 1200.0
export var gravity = 4500

var jumpsMade = 0
var velocity = Vector2.ZERO

onready var pivot: Node2d = $PlayerSkin #animated sprite
onready var animationPlayer: AnimationPlayer = $PlayerSkin/AnimationPlayer
onready var startScale: Vector2 = pivot.scale 

func _physics_process(delta:float) -> void:
    var horizontalDirection = (
        Input.get_action_stregth("ui_right") - Input.get_action_stregth("ui_left")
    )

    velocity.x = horizontalDirection * speed
    velocity.y += gravity * delta

    var isFalling = velocity.y > 0.0 and not is_on_floor()
    var isJumping = Input.is_action_just_pressed("jump") and is_on_floor()
    var isDoubleJumping = Input.is_action_just_pressed("jump") and isFalling
    var isJumpCancelled = Input.is_action_just_released("jump") and velocity.y < 0.0
    var isIdling = is_on_floor and is_zero_approx(velocity.x)
    var isRunning = is_on_floor and not is_zero_approx(velocity.x)

    if isJumping:
        jumpsMade += 1
        velocity.y = -jumpStrength
    elif isDoubleJumping:
        jumpsMade += 1
        if jumpsMade <= maximumJumps:
            velocity.y = -doubleJumpStrength
    elif isJumpCancelled:
        velocity.y = 0.0
    elif isIdling or isRunning:
        jumpsMade = 0

    velocity = move_and_slide(velocity, Vector2.UP) #upDirection

    if not is_zero_approx(velocity.x):
        pivot.scale.x = sign(velocity.x) * startScale.x #sign = '+' or '-'

    if isJumping or isDoubleJumping:
        animationPlayer.play("Jump")
    elif isRunning:
        animationPlayer.play("Run")
    elif isFalling:
        animationPlayer.play("Fall")
    elif isIdling:
        animationPlayer.play("Idle")