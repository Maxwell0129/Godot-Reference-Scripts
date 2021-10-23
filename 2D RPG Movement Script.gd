extends KinematicBody2D

export var speed = 700.0

func _physics_process(delta:float) -> void:
    var inputVector = Vector2(
        Input.get_action_stregth("ui_right") - Input.get_action_stregth("ui_left"),
        Input.get_action_stregth("ui_down") - Input.get_action_stregth ("ui_up")
    )

    var moveDirection = inputVector.normalized()
    velocity = move_and_slide(speed * moveDirection)