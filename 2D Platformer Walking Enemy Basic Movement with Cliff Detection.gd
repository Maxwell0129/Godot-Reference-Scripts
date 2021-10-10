extends KinematicBody2D

export var direction = -1
export var detects_cliffs = true

var speed = 50
var velocity = Vector2.ZERO

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$FloorChecker.position.x  = $WorldDetection.shape.get_extents().x * direction 

	$FloorChecker.enabled = detects_cliffs 

    #FloorChecker - RayCast2D
    #WorldDetection - Collision Shape > Rectangle
	
func _physics_process(delta):
	if is_on_wall() or not $FloorChecker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h 
		$FloorChecker.position.x  = $WorldDetection.shape.get_extents().x * direction 

	velocity.y += 20
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)