extends Position2D

export var right = 0
export var left = 0

func _physics_process(delta: float) -> void:
	$Area2D/CollisionShape2D.disabled = true
	if Input.is_action_pressed("ui_right"):
		$Area2D.position = Vector2(right,0)
	elif Input.is_action_pressed("ui_left"):
		$Area2D.position = Vector2(left,0)
	elif Input.is_action_pressed("use") and not Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left") :
		$Area2D/CollisionShape2D.disabled = false


#Scene Setup: Position2D > Area2D > CollisionShape2D