class_name Run extends PlayerState

func Enter():
	pass
	
func Update(_delta):
	# Добавляем обработку состояний
	HandleStates([
		player.IDLE,
		player.JUMP,
		player.FALL
	])
	# Анимируем
	player.Animator.play(player.RUN)

func Handle():
	if player.moveDirectionX != 0 and player.is_on_floor():
		player.PlayerSM.ChangeState(player.RUN)
