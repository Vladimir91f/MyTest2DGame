class_name Jump extends PlayerState

const JUMP_VELOCITY = -240.0
const JumpMultiplier = 0.5

func Enter():
	player.velocity.y = JUMP_VELOCITY
	
func Update(_delta):
	HandleMaxJumpVelocity()
	# Добавляем обработку состояний
	HandleStates([player.FALL, player.WALL_JUMP])
	# Анимируем
	player.Animator.play(player.JUMP)
	
#  Делаем высоту прыжка зависимой от длительности нажатия кнопки прыжка
func HandleMaxJumpVelocity():
	if(!player.keyJumpPressed): # если игрок отпустил клавишу прыжка - уменьшить высоту прыжка
		player.velocity.y *= JumpMultiplier
		player.PlayerSM.ChangeState(player.FALL)
		
func Handle():
	if player.keyJumpJustPressed and player.is_on_floor():
		player.PlayerSM.ChangeState(player.JUMP)
