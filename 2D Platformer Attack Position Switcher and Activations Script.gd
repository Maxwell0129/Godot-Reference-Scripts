extends Position2D

export var right = 0
export var left = 0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		$Area2D.position = Vector2(right,0)
	elif Input.is_action_pressed("ui_left"):
		$Area2D.position = Vector2(left,0)

	if Input.is_action_just_pressed("attack") and not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		$Area2D/CollisionShape2D.disabled = false
	elif Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		$Area2D/CollisionShape2D.disabled = true

#Scene Setup: Position2D > Area2D > CollisionShape2D