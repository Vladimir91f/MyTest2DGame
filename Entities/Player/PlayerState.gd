class_name PlayerState extends State

@onready var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(Player != null, "Состояние PlayerState должно использоваться только в сцене игрока. Необходимо чтобы владельцем был узел Player.")
