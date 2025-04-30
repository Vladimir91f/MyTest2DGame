class_name Run extends PlayerState

func Enter():
	pass
	
func Update(_delta):
	player.Animator.play(player.RUN)
