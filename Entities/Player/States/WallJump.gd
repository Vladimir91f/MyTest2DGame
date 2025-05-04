class_name WallJump extends PlayerState

const WALL_JUMP_VELOCITY = -190

func Enter():
	player.velocity.y = WALL_JUMP_VELOCITY
	
func Update(_delta):
	# Добавляем обработку состояний
	HandleStates([
		player.FALL
	])
	# Анимируем
	player.Animator.play(player.WALL_JUMP)

func Handle():
	if ((player.wallDirectionX == Vector2.LEFT and player.keyJumpJustPressed and player.keyRightPressed)
	or (player.wallDirectionX == Vector2.RIGHT and player.keyJumpJustPressed and player.keyLeftPressed)):
		player.PlayerSM.ChangeState(player.WALL_JUMP)
