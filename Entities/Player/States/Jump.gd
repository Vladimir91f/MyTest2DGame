class_name Jump extends PlayerState

const JUMP_VELOCITY = -300.0

func Enter():
	player.velocity.y = JUMP_VELOCITY
	
func Update(_delta):
	player.Animator.play(player.JUMP)
