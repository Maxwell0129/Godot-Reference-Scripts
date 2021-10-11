extends KinematicBody2D

func _on_Timer_timeout() -> void:
	queue_free()

func _on_EnemyHurtArea_area_entered(PlayerHurtBox: Area2D) -> void:
	$EnemyHurtArea.position.x

func _on_EnemyHitbox_area_entered(PlayerStompArea: Area2D) -> void:
	$EnemyHurtArea.queue_free()
	$EnemyHitbox.queue_free()
	speed = 0
	$AnimatedSprite.play("Killed")
	$Timer.start()

#Signal 'area_entered' and 'timeout' needs to be connected to work properly