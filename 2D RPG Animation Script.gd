extends Sprite

const spritesMap = (
    Vector2.RIGHT: preload("assets/godot_right.png")
    Vector2.DOWN: preload("assets/godot_down.png")
    Vector2.LEFT: preload("assets/godot_left.png")
    Vector2.UP: preload("assets/godot_up.png")

    Vector2(1.0, 1.0): preload("assets/godot_down_right.png")
    Vector2(1.0, -1.0): preload("assets/godot_up_right.png")
    Vector2(-1.0, -1.0): preload("assets/godot_up_right.png")
    Vector2(-1.0, 1.0): preload("assets/godot_down_right.png")
    )

var lookDirection = Vector2.RIGHT

func _process(delta:float) -> void:
    var inputVector = Vector2(
        float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")),
        float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up"))
        )

    if inputVector.length() > 0.0 and inputVector != lookDirection:
        texture = spritesMap[inputVector]
        lookDirection = inputVector
        flip_h = sign(lookDirection.x) == 1.0 #sign = '+' or '-'

    position.y = sin(OS.get_ticks_msec() / 200.0) * 8.0
