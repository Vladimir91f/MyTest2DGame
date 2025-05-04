class_name Fall extends PlayerState

const GRAVITY_FALL = 200
const MAX_FALL_VELOCITY = 300
const AIR_ACCELERATION = 15
const AIR_DECELERATION = 20

func Enter():
	pass
	
func Update(delta):
	# При падении добавляем возможность двигаться и
	# делаем движения влево/вправо не такими быстрыми как на земле
	player.HandleHorizontalMovement(AIR_ACCELERATION, AIR_DECELERATION)
	player.HandleGravity(delta, GRAVITY_FALL)
	# Ограничиваем максимальную скорость падения
	HandleMaxFallVelocity()
	# Добавляем обработку состояний
	HandleStates([player.IDLE, player.RUN, player.JUMP, player.WALL_JUMP])
	# Анимируем
	player.Animator.play(player.FALL)

func HandleMaxFallVelocity():
	if(player.velocity.y > MAX_FALL_VELOCITY): player.velocity.y = MAX_FALL_VELOCITY
	
func Handle():
	if not player.is_on_floor() and player.velocity.y >= 0:
		player.PlayerSM.ChangeState(player.FALL)
