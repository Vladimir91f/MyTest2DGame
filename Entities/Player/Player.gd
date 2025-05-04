class_name Player extends CharacterBody2D

@onready var Collider: CollisionShape2D = $Collider
@onready var Sprite: Sprite2D = $Sprite
@onready var Animator: AnimationPlayer = $Animator
@onready var PlayerSM: Node = $StateMachine
@onready var RCWallKickLeft: RayCast2D = $Raycasts/WallJump/WallKickLeft
@onready var RCWallKickRight: RayCast2D = $Raycasts/WallJump/WallKickRight

# States
const IDLE = "Idle"
const RUN = "Run"
const JUMP = "Jump"
const FALL = "Fall"
const WALL_JUMP = "WallJump"

# Movement
const RUN_SPEED = 120.0
const GROUND_ACCELERATION = 40 # ускорение на земле
const GROUND_DECELERATION = 50 # замедление на земле
var moveDirectionX = 0

# Gravity
const GRAVITY_JUMP = 600

# WallJump
var wallDirectionX = 0

var facing = 0 # куда повернут игрок ((-1) - лево, 1 - право)

var keyRightPressed = false
var keyLeftPressed = false
var keyUpPressed = false
var keyDownPressed = false
var keyJumpPressed = false
var keyJumpJustPressed = false # одинарное нажатие

func _physics_process(delta: float) -> void:
	
	HandleGravity(delta)
	HandleWallCollisions()
	HandleKeyInput()
	HandleHorizontalMovement()
	HandleSpriteFlipH()

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
	
func HandleGravity(delta: float, gravity: float = GRAVITY_JUMP):
	if not is_on_floor():
		velocity.y += gravity * delta
		
func HandleHorizontalMovement(acceleration: float = GROUND_ACCELERATION, deceleration: float = GROUND_DECELERATION):
	moveDirectionX = Input.get_axis("KeyLeft", "KeyRight")
	if(moveDirectionX != 0):
		velocity.x = move_toward(velocity.x, moveDirectionX * RUN_SPEED, acceleration)
	else: # Для плавной остановки игрока
		velocity.x = move_toward(velocity.x, moveDirectionX * RUN_SPEED, deceleration)

func HandleWallCollisions():
	if(RCWallKickRight.is_colliding()):
		wallDirectionX = Vector2.RIGHT
	elif(RCWallKickLeft.is_colliding()):
		wallDirectionX = Vector2.LEFT
	else:
		wallDirectionX = Vector2.ZERO

func HandleSpriteFlipH():
	Sprite.flip_h = facing < 1
