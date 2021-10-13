extends KinematicBody2D

const KNOCKBACK = 500
const JUMP_FORCE = -500

var velocity = Vector2.ZERO

func _on_PlayerHurtBox_area_entered(EnemyHurtArea: Area2D) -> void:
	if $AnimatedSprite.global_position.x < EnemyHurtArea.global_position.x:
		velocity.x -= KNOCKBACK
		Input.action_press("ui_left")
		Input.action_release("ui_left")
	elif $AnimatedSprite.global_position.x > EnemyHurtArea.global_position.x:
		velocity.x += KNOCKBACK
		Input.action_press("ui_right")
		Input.action_release("ui_right")
	
	if $AnimatedSprite.global_position.y < EnemyHurtArea.global_position.y:
		velocity.y = (JUMP_FORCE * 0.5)
	elif $AnimatedSprite.global_position.y > EnemyHurtArea.global_position.y:
		velocity.y = -(JUMP_FORCE * 0.5)

func _on_PlayerStompArea_area_entered(_EnemyHitBox: Area2D) -> void:
	velocity.y = JUMP_FORCE * 0.3

#Signal 'area_entered' needs to be connected to work properly