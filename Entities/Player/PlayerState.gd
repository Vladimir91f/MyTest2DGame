class_name PlayerState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"

@onready var player: CharacterBody2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(Player != null, "Состояние PlayerState должно использоваться только в сцене игрока. Необходимо чтобы владельцем был узел Player.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
