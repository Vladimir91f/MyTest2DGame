class_name Idle extends PlayerState

func Enter():
	player.velocity = Vector2.ZERO
	
func Update(_delta):
	player.Animator.play(player.IDLE)
