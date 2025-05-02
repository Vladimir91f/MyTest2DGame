class_name Jump extends PlayerState

const JUMP_VELOCITY = -240.0
const JumpMultiplier = 0.5

func Enter():
	player.velocity.y = JUMP_VELOCITY
	
func Update(_delta):
	HandleJumpToFall()
	player.Animator.play(player.JUMP)
	
#  Делаем высоту прыжка зависимой от длительности нажатия кнопки прыжка
func HandleJumpToFall():
	if(!player.keyJumpPressed): # если игрок отпустил клавишу прыжка - уменьшить высоту прыжка
		player.velocity.y *= JumpMultiplier
		player.PlayerSM.ChangeState(player.FALL)
