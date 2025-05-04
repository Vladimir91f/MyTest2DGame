class_name WallSlide extends PlayerState

const WALL_SLIDE_SPEED = 40

func Enter():
	pass
	
func Update(_delta):
	HandleWallSlideMovement()
	# Добавляем обработку состояний
	HandleStates([
		player.IDLE,
		player.RUN,
		player.WALL_JUMP
	])
	# Анимируем
	player.Animator.play(player.WALL_SLIDE)

func Handle():
	if((player.wallDirectionX == Vector2.LEFT and player.keyLeftPressed and player.RCWallKickLeft.is_colliding())
	or (player.wallDirectionX == Vector2.RIGHT and player.keyRightPressed and player.RCWallKickRight.is_colliding())):
		if(!player.keyJumpJustPressed and !player.keyJumpPressed):
			player.PlayerSM.ChangeState(player.WALL_SLIDE)

func HandleWallSlideMovement():
	# Если игрок просто прыгает у стены, скольжения не будет
	if(player.wallDirectionX == Vector2.ZERO or (!player.keyLeftPressed and !player.keyRightPressed)):
		player.PlayerSM.ChangeState(player.FALL)
	
	player.velocity.y = WALL_SLIDE_SPEED
