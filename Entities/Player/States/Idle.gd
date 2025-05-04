class_name Idle extends PlayerState

func Enter():
	player.velocity = Vector2.ZERO
	
func Update(_delta):
	# Добавляем обработку состояний
	HandleStates([
		player.RUN,
		player.JUMP
	])
	# Анимируем
	player.Animator.play(player.IDLE)
	
func Handle():
	if(player.moveDirectionX == 0 and player.is_on_floor()):
		player.PlayerSM.ChangeState(player.IDLE)
