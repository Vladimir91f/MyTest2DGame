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
	HandleMaxFallVelocity()
	player.Animator.play(player.FALL)

# Ограничиваем максимальную скорость падения
func HandleMaxFallVelocity():
	if(player.velocity.y > MAX_FALL_VELOCITY): player.velocity.y = MAX_FALL_VELOCITY
