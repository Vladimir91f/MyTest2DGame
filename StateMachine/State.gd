class_name State extends Node

var AllStates: Dictionary[String, State] = {}

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	pass

# Обработка входа в состояние
func Handle():
	pass

# Обработка состояний
func HandleStates(names: Array[String]):
	for state in AllStates.values():
		if(state.name in names):
			state.Handle()
