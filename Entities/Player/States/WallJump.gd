class_name WallJump extends PlayerState

const WALL_JUMP_VELOCITY = -190

func Enter():
	player.velocity.y = WALL_JUMP_VELOCITY
	
func Update(_delta):
	player.Animator.play(player.WALL_JUMP)
