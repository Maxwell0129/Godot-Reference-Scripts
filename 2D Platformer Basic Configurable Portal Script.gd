extends Area2D

export(String, FILE, ".tscn") var next_level

func _on_Portal_body_entered(body: Node) -> void:
	if "Player" in body.name:
		get_tree().change_scene(next_level)

#Signal 'body_entered' needs to be connected