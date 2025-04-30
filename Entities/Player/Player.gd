class_name Player extends CharacterBody2D

@onready var Collider: CollisionShape2D = $Collider
@onready var Sprite: Sprite2D = $Sprite
@onready var Animator: AnimationPlayer = $Animator

# Movement
const RUN_SPEED = 150.0
const GROUND_ACCELERATION = 40 # ускорение на земле
const GROUND_DECELERATION = 50 # замедление на земле
var moveDirectionX = 0

# Jump
const JUMP_VELOCITY = -300.0
const GRAVITY_POWER = 700

var facing = 0 # куда повернут игрок ((-1) - лево, 1 - право)

var keyRightPressed = false
var keyLeftPressed = false
var keyUpPressed = false
var keyDownPressed = false
var keyJumpPressed = false
var keyJumpJustPressed = false # одинарное нажатие

func _physics_process(delta: float) -> void:
	
	HandleGravity(delta)
	HandleKeyInput()
	HandleHorizontalMovement()
	HandleSpriteFlipH()

	# Handle jump. Анимация не будет работать, её перекроет анимация бега
	if keyJumpJustPressed and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Animator.play('Jump')

	if not is_on_floor() and velocity.y >= 0:
		Animator.play('Fall')
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if !keyJumpJustPressed and is_on_floor():
		if moveDirectionX:
			Animator.play('Run')
		else:
			Animator.play('Idle')

	move_and_slide()
	
func HandleKeyInput():
	keyLeftPressed = Input.is_action_pressed("KeyLeft")
	keyRightPressed = Input.is_action_pressed("KeyRight")
	keyUpPressed = Input.is_action_pressed("KeyUp")
	keyDownPressed = Input.is_action_pressed("KeyDown")
	keyJumpPressed = Input.is_action_pressed("KeyJump")
	keyJumpJustPressed = Input.is_action_just_pressed("KeyJump")
	
	if(keyLeftPressed): facing = -1
	if(keyRightPressed): facing = 1
	
func HandleGravity(delta: float, gravityPower: float = GRAVITY_POWER):
	if not is_on_floor():
		velocity.y += gravityPower * delta
		
func HandleHorizontalMovement(acceleration: float = GROUND_ACCELERATION, deceleration: float = GROUND_DECELERATION):
	moveDirectionX = Input.get_axis("KeyLeft", "KeyRight")
	if(moveDirectionX != 0):
		velocity.x = move_toward(velocity.x, moveDirectionX * RUN_SPEED, acceleration)
	else: # Для плавной остановки игрока
		velocity.x = move_toward(velocity.x, moveDirectionX * RUN_SPEED, deceleration)
		
func HandleSpriteFlipH():
	Sprite.flip_h = facing < 1
