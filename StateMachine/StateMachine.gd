class_name StateMachine extends Node

@export var InitialState: State = null

@onready var _currentState: State = (func get_initial_state() -> State:
	return InitialState if InitialState != null else get_child(0)
).call()

var States: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Initialize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_currentState.Update(delta)

func Initialize():
	for stateNode: State in self.get_children():
		States[stateNode.name] = stateNode

func ChangeState(newStateName):
	if not has_node(newStateName):
		printerr("Невозможно перейти в состояние '" + newStateName + "' - состояние не существует.")
		return
		
	var previousState = _currentState
	previousState.Exit()

	var newState = get_node(newStateName)
	_currentState = newState
	_currentState.Enter()
