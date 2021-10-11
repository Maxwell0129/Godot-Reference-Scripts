extends Area2D

func _on_Switch_area_entered(PlayerUse: Area2D) -> void:
	if $AnimatedSprite.get_animation() == "Off":
		$AnimatedSprite.play("On")
	elif  $AnimatedSprite.get_animation() == "On":
		$AnimatedSprite.play("Off")

#Signal 'area_entered' needs to be connected to work properly