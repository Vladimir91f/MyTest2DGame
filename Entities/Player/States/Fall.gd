class_name Fall extends PlayerState

func Enter():
	pass
	
func Update(_delta):
	player.Animator.play(player.FALL)
